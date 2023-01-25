class Comments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :author_id
      t.text :text
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
