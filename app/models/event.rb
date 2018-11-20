class Event < ApplicationRecord
<<<<<<< HEAD
  has_many :bids
  belongs_to :user
  belongs_to :user, through: :bids
  belongs_to :service
=======
  # has_many :bids
  # belongs_to :user
  # belongs_to :user, through: :bids
  # belongs_to :service
>>>>>>> e610e1e074299c6e0ea6c13310537d99889b7f69

  # validates_presence_of :name, :date, :event_type, :location, :description, :party_size, :service, :min_price, :max_price

end
