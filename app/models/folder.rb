class Folder < ApplicationRecord
  has_one_attached :file
  belongs_to :demo1
end
