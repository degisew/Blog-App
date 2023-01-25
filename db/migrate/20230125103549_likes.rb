class Likes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.string :author_id
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
    
    t.timestamps
    end
  end
end
