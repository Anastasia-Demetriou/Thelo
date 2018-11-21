class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

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

  def confirmed_bid
    bid.confirmed?
  end

end
