class Service < ApplicationRecord
  has_many :user_services, dependant: :destroy
  has_many :users, through: :user_services
  has_many :events
end
