class Posts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :author_id     
      t.string :title 
      t.text :text    
      t.integer :comments_counter
      t.integer :likes_counter
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
