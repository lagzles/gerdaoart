class Image < ApplicationRecord

  validates :title, presence: true

  mount_uploader :url, ImageUploader

  belongs_to :carousel
end
