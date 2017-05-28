class Carousel < ApplicationRecord

  validates :name, :category_id, :description, presence: true

  has_many :images

  belongs_to :category

end
