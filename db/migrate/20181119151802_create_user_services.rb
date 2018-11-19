class CreateUserServices < ActiveRecord::Migration[5.2]
  def change
    create_table :user_services do |t|

      t.timestamps
    end
  end
end
