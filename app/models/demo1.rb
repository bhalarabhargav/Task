class Demo1 < ApplicationRecord
  has_many_attached :files

  validates :country, presence: true, inclusion: { in: ->(_) { CS.countries.keys.map(&:to_s) }, message: "must be a valid country" }
  validates :state, presence: true, inclusion: { in: ->(record) { record.states.keys.map(&:to_s) }, allow_blank: true, message: "must be a valid state" }
  validates :city, presence: true, inclusion: { in: ->(record) { record.cities.map(&:to_s) }, allow_blank: true, message: "must be a valid city" }

  validate :acceptable_files


  def self.search(params)
    demo1s = all
    demo1s = demo1s.where('name LIKE ?', "%#{params[:search_name]}%") if params[:search_name].present?
    demo1s = demo1s.where('description LIKE ?', "%#{params[:search_description]}%") if params[:search_description].present?
    demo1s = demo1s.where('status LIKE ?', "%#{params[:search_status]}%") if params[:search_status].present?
    demo1s = demo1s.where('country LIKE ?', "%#{params[:search_country]}%") if params[:search_country].present?
    demo1s = demo1s.where('state LIKE ?', "%#{params[:search_state]}%") if params[:search_state].present?
    demo1s = demo1s.where('city LIKE ?', "%#{params[:search_city]}%") if params[:search_city].present?
    demo1s = demo1s.where('file LIKE ?', "%#{params[:search_file]}%") if params[:search_file].present?
    demo1s
  end
  
  

  # File validation for size and types
  def acceptable_files
    return unless files.attached?

    files.each do |file|
      # Validate size
      if file.byte_size > 10.megabytes
        errors.add(:files, "is too big. Must be less than 10MB.")
      end

      # Validate content type
      unless file.content_type.in?(ACCEPTABLE_FILE_TYPES)
        errors.add(:files, "must be a valid file type (#{ACCEPTABLE_FILE_TYPES.join(', ')}).")
      end
    end
  end

  # Constant for allowed file types
  ACCEPTABLE_FILE_TYPES = [
    "image/jpeg", 
    "image/png", 
    "image/gif", 
    "application/pdf", 
    "text/plain", 
    "application/zip", 
    "application/msword", 
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
    "application/vnd.ms-excel", 
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", 
    "application/octet-stream"
  ].freeze

  # Countries, States, and Cities Helpers
  def countries
    CS.countries
  end

  def states
    return {} unless country.present?
    CS.states(country.to_sym)
  end

  def cities
    return [] unless state.present? && country.present?
    CS.cities(state.to_sym, country.to_sym) || []
  end
end
