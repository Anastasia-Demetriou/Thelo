class AddReviewedUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :reviewed_user, references: :users, index: true
    add_foreign_key :reviews, :users, column: :reviewed_user_id

  end
end
