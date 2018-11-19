class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.string :event_type
      t.string :location
      t.text :description
      t.integer :party_size
      t.integer :max_price
      t.integer :min_price
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
