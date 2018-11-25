class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  attr_reader

  def home
  end

  def dashboard

    # @event = Event.find(params[:id])
    # @reviewed_user = User.find(params[:user_id])
    # @order = Order.find(params[:id])
    # @event = Event.find(params[:event_id])

    @user = current_user
    first_name = @user.first_name
    last_name = @user.last_name
    authorize @user

  #PROFESSIONAL
    #bids made by professional
    bids = Bids.all

    @professional_bids = @user.bids
    #accepted bids - profesional
    #list all professional events
    @accepted_bids = bids.where(user_id: @user.id).where(status: "accepted")
    #pending
    @pending_bids = @user.bids.where(status: "pending")
    #declined bids - profesional
    @declined_bids = @user.bids.where(status: "declined")

    #list of events the professional has bid on
    @professional_events = Bid.where(user_id: @user.id)

    # @professional_events = []
    # @professional_bids.events.each do |event|
    #   @professional_events << event
    # end

  #HOST

   #list all host events
    @host_events = Event.where(user_id: @user.id)

    #bids recieved for each event
    @host_bids = Bid.where(user_id: @user.id)

  #BOTH
    #reviews made by user
    @reviews = Review.where(reviewed_user_id: @user.id)

    # respond_to do |format|
    #   format.html #looks for views/users/dashboard.html.erb
    #   format.js   #looks for views/users/dashboard.js.erb
    # end

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
