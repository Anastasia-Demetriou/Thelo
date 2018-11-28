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

  # validates :service, presence: true, if: :is_professional?


  def is_professional?
    professional
  end

  def accepted_bids_number
    bids.where(status: "accepted").count
  end

  def average_review_score
    given_reviews = Review.where(reviewed_user: self).map(&:rating)
    if given_reviews.any?
      return 0 if given_reviews.include?(nil)
      return (given_reviews.sum / given_reviews.count.to_f).round
    else
      return 0
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
