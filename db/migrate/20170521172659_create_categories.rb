class CreateCategories < ActiveRecord::Migration[5.0]
  def up
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    add_column :images, :category_id, :integer, index: true
  end

  def down
    remove_column :images, :category_id
    drop_table :categories
  end
end
