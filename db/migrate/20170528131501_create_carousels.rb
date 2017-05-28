class CreateCarousels < ActiveRecord::Migration[5.0]
  def up
    create_table :carousels do |t|
      t.string :name
      t.integer :category_id
      t.string  :description
      t.string :tags

    end

    add_column :images, :carousel_id, :integer, :index => true
    add_column :images, :order, :integer
    remove_column :images, :description
    remove_column :images, :tags

  end


  def down
    add_column :images, :tags, :string
    add_column :images, :description, :string
    remove_column :images, :order
    remove_column :images, :carousel_id
    remove_column :images, :category_id
    drop_table :carousels
  end
end
