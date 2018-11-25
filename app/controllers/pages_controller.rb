class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  attr_reader

  def home
  end


  def professional_dashboard
    @user = current_user
    @events = []
    @user.bids.each do |bid|
      @events << bid.event
    end
    @bookings = []
    @events.confirmed_bid.each do |booking|
      @bookings << booking
    end
  end

  def host_dashboard

  end

  # dashboard where the current user can edit his profile and see his history
  def dashboard
  end


private

  def professional?
    @user = current_user.professional
  end

  def accepted
    @user.bid.accepted == true
  end

  def decline
    @user.bid.declined == true
  end


  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :bio, :professional)
  end

  def bid_params
    params.require(:bid).permit(:price, :description, :status, :quote)
  end


  def event_params
    params.require(:event).permit(:user_id, :service_id, :name, :date, :event_type, :location, :description, :party_size, :max_price, :min_price)
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
