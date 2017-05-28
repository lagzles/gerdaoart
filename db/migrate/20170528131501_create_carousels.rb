class CreateCarousels < ActiveRecord::Migration[5.0]
  def up
    create_table :carousels do |t|
      t.string :name
      t.integer :category_id

    end

    add_column :images, :carousel_id, :integer, :index => true
  end


  def down
    remove_column :images, :carousel_id
    drop_table :carousels
  end
end
