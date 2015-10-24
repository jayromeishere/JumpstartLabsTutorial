class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author_name
      t.text :body
        t.references :article, index: true, foreign_key: true #references signifies a one-to-many relationship -- one article can have many comments

      t.timestamps null: false
    end
  end
end
