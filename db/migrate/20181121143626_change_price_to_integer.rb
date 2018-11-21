class ChangePriceToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :bids, :quote, :integer
  end
end
