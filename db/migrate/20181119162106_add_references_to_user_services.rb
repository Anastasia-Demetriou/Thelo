class AddReferencesToUserServices < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_services, :user, foreign_key: true
    add_reference :user_services, :service, foreign_key: true
  end
end
