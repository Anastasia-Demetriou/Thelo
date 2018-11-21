class AddStripeToBids < ActiveRecord::Migration[5.2]
  def change
    add_column :bids, :sku, :string
  end
end
