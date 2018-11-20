class Event < ApplicationRecord
  has_many :bids
  belongs_to :user

  belongs_to :service

  validates :name, :date, :event_type, :location, :description, :party_size, :min_price, :max_price, presence: true

end
