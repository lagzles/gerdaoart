class Carousel < ApplicationRecord

  validates :name, :category_id, :image_id, :order, :url, presence: true

  mount_uploader :url, ImageUploader

  belongs_to :image

  belongs_to :category

end
