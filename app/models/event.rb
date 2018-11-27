class Event < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_many :bids
  belongs_to :user

  belongs_to :service


  validates_presence_of :name, :date, :location, :description, :party_size, :min_price, :max_price

end
