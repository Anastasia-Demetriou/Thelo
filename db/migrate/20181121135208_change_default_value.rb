class ChangeDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column_default :bids, :status, from: "true", to: "pending"
  end
end
