class User < ApplicationRecord
  has_many :events
  has_many :bids
  has_many :user_services, dependant: :destroy
  has_many :services, through: :user_services


  validates_presence_of :first_name, :last_name, :password
  validates :email, uniqueness: { case_sensitive: false }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
