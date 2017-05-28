class Image < ApplicationRecord

  validates :title, presence: true

  # mount_uploader :url, ImageUploader

  has_many :carousels

  belongs_to :category
end
