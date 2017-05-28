class Image < ApplicationRecord

  validates :title, presence: true

  # mount_uploader :url, ImageUploader

  has_many :carousels

  belongs_to :category


    def list_urls
      urls=[]
      self.carousels.each do |c|
        urls << c.url.url
      end
      return urls
    end

end
