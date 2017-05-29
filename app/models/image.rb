class Image < ApplicationRecord

  validates :name,  :drawing_id, :order,  presence: true

  mount_uploader :url, ImageUploader

  belongs_to :drawing

  # belongs_to :category

end
