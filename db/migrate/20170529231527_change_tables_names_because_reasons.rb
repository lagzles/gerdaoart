class ChangeTablesNamesBecauseReasons < ActiveRecord::Migration[5.0]
  def up
    rename_table :images, :drawings
    rename_table :carousels, :images
  end

  def down
    rename_table :images, :carousels
    rename_table :drawings,  :images
  end
end
