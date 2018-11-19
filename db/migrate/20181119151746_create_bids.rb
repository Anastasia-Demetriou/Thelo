class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.decimal :price
      t.text :description
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
