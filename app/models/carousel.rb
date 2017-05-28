class Carousel < ApplicationRecord

  validates :name,  :image_id, :order,  presence: true

  mount_uploader :url, ImageUploader

  belongs_to :image

  # belongs_to :category

end
