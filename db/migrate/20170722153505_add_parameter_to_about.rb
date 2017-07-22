class AddParameterToAbout < ActiveRecord::Migration[5.0]
  def up
    drop_table :abouts

    create_table :abouts do |t|
      t.string :body
      t.boolean :pinned, :default => false
      t.timestamps
    end
  end

  def down
    drop_table :abouts

    create_table :abouts do |t|
      t.string :body
    end
  end
end
