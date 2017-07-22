class AddParameterToAbout < ActiveRecord::Migration[5.0]
  def up
    add_column :abouts, :pinned, :boolean, :default => false
  end

  def down
    remove_column :abouts, :pinned
  end
end
