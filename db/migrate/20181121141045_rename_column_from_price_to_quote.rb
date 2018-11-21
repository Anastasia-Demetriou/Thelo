class RenameColumnFromPriceToQuote < ActiveRecord::Migration[5.2]
  def change
    rename_column :bids, :price, :quote
  end
end
