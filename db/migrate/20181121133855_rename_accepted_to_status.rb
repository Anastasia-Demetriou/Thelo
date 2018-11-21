class RenameAcceptedToStatus < ActiveRecord::Migration[5.2]
  def change
    rename_column :bids, :accepted, :status
  end
end
