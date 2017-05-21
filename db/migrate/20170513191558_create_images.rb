class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :url
      t.string :title
      t.string :description
      t.string :tags

      t.timestamps
    end
  end
end
