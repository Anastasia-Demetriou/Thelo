class User < ApplicationRecord
  has_many :events
  has_many :bids
  has_many :user_services, dependent: :destroy
  has_many :services, through: :user_services

  # validations means we can't sign up wihtout give a first_name etc, it should be done later on the edit

  # validates_presence_of :first_name, :last_name, :password
  # validates :email, uniqueness: { case_sensitive: false }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
