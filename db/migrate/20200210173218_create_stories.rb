class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :content
      t.integer :average_rating
      t.boolean :published?, default: false
      t.integer :user_id
      t.integer :jam_id

      t.timestamps null: false
    end
  end
end
