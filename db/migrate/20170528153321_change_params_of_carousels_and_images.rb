class ChangeParamsOfCarouselsAndImages < ActiveRecord::Migration[5.0]
  def up
    # ajuste de carousel
    remove_column :carousels, :category_id
    remove_column :carousels, :tags
    add_column :carousels, :image_id, :integer, :index => true
    add_column :carousels, :order, :integer
    add_column :carousels, :url, :string

    #ajuste de images
    remove_column :images, :carousel_id
    remove_column :images, :url
    remove_column :images, :order
    # add_column :images, :category_id, :integer, index: true
  end

  def down
    remove_column :images, :category_id
    add_column :images, :order, :integer
    add_column :images, :url, :string
    add_column :images, :carousel_id, :integer, index: true

    remove_column :carousels, :url
    remove_column :carousels, :order
    remove_column :carousels, :image_id
    add_column :carousels, :tags, :string
    add_column :carousels, :category_id, :integer, index: true

  end
end
