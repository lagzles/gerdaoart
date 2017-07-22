class AddAnotherParamToAbout < ActiveRecord::Migration[5.0]
  def up
    add_column :abouts, :url_address, :string
    add_column :abouts, :url_title, :string
  end

  def down
    remove_column :abouts, :url_address
    remove_column :abouts, :url_title
  end
end
