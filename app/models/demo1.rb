class Demo1 < ApplicationRecord

  # The code of the attached file 
  has_one_attached :file
  validate :acceptable_file     
  
  validates :country, presence: true, inclusion: { in: ->(record) { record.country }, allow_blank: true }
  validates :state, presence: true, inclusion: { in: ->(record) { record.states.keys }, allow_blank: true }
  validates :city, presence: true, inclusion: { in: ->(record) { record.cities }, allow_blank: true }

  def acceptable_file
    return unless file.attached?

    unless file.byte_size <= 10.megabytes
      errors.add(:file, "is too big. Must be less than 10MB.")
    end
    acceptable_types = [
      "image/jpeg", 
      "image/png", 
      "image/gif", 
      "application/pdf", 
      "text/plain", 
      "application/zip", 
      "application/msword", # .doc
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document", # .docx
      "application/vnd.ms-excel", # .xls
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", # .xlsx
      "application/octet-stream" # For other binary files
    ]

    if !acceptable_types.include?(file.content_type)
      errors.add(:file, "must be a valid file type (JPEG, PNG, GIF, PDF, TXT, ZIP, DOC, DOCX, XLS, XLSX).")
    end
    
  end
  
  def countries
    CS.countries.with_indifferent_access
  end

  def states
    CS.states(country).with_indifferent_access
  end

  def cities
    return [] unless state.present?
    CS.cities(state, country) || []
  end



end
