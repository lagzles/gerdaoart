class Carousel < ApplicationRecord

  validates :name, :category_id, :description, presence: true

  has_many :images

  belongs_to :category


  def image_urls
    urls = Array.new
    self.images.each do |image|
      urls << image.url
    end
    return urls
  end

end
