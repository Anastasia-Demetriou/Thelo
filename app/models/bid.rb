class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :price, presence: true
end
