class CreateJams < ActiveRecord::Migration
  def change
    create_table :jams do |t|
      t.string :name
      t.string :theme
      t.string :status, default: 'upcoming'
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
