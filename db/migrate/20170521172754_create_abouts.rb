class CreateAbouts < ActiveRecord::Migration[5.0]
  def up
    create_table :abouts do |t|
      t.string :body

      t.timestamps

    end
  end

  def down
    drop_table :abouts
  end
end
