class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewed_user, class_name: :User, foreign_key: :reviewed_user_id
end
