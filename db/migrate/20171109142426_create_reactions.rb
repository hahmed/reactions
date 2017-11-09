class CreateReactions < ActiveRecord::Migration[5.2]
  def change
    create_table :reactions do |t|
      t.references :article, index: true, null: false
      t.string :type
      t.text :content

      t.timestamps
    end
  end
end
