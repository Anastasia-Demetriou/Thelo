class User < ApplicationRecord
  has_many :events
  has_many :bids
  has_many :user_services, dependent: :destroy
  has_many :services, through: :user_services
  has_many :reviews, dependent: :destroy

  has_many :orders
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true

  validates :email, uniqueness: { case_sensitive: false }
  # validates :service, presence: true, if: :is_professional?


  def is_professional?
    professional
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
