class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :event
  monetize :price_cents

  validates :quote, presence: true
end
