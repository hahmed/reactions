class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :section
      t.string :title, null: false
      t.text :abstract
      t.string :url, null: false
      t.string :source
      t.datetime :published_date
      t.string :author

      t.timestamps
    end
  end
end
