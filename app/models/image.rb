class Image < ApplicationRecord

  validates :title, presence: true

  # mount_uploader :url, ImageUploader

  has_many :carousels

  belongs_to :category


    def list_urls
      urls = Array.new
      self.carousels.each do |c|
        puts c.url.url
        urls << c.url.url
      end
      return urls
    end

end
