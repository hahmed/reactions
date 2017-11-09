class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :section # category
      t.text :abstract
      t.string :url, null: false
      t.string :source
      t.datetime :published_date
      t.string :author

      t.timestamps
    end
  end
end
