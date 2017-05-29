class ChangeTablesNamesBecauseReasons < ActiveRecord::Migration[5.0]
  def up
    rename_table :images, :drawings
    rename_column :carousels, :image_id, :drawing_id
    # add_column :carousels, :drawing_id, :integer, index: true
    rename_table :carousels, :images
  end

  def down
    rename_table :images, :carousels
    rename_column :carousels, :drawing_id, :image_id
    # remove_column :carousels, :drawing_id
    # add_column :carousels, :image_id, :integer, index: true

    rename_table :drawings,  :images
  end
end
