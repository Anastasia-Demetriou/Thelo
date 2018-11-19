class Service < ApplicationRecord
  belongs_to :event
  has_many :user_services
  has_many :users, through: :user_services
  has_many :events
end
