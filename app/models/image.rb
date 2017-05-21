class Image < ApplicationRecord

  validates :url, :title, presence: true

  mount_uploader :url, ImageUploader

  belongs_to :category
end
