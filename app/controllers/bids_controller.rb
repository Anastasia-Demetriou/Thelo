class BidsController < ApplicationController
  before_action :set_bid, only: [:accept, :show, :edit, :update, :destroy]

  def index
    @bids = policy_scope(Bid).order(created_at: :desc)
  end

  def dashboard

    # @event = Event.find(params[:id])
    # @reviewed_user = User.find(params[:user_id])
    # @order = Order.find(params[:id])
    # @event = Event.find(params[:event_id])

    @user = current_user
    authorize @user

  #PROFESSIONAL
    #bids made by professional
    @professional_bids = @user.bids
    #accepted bids - profesional
    #list all professional events
    @accepted_bids = Bids.where(user_id: current_user.id).where(status: "accepted")
    #pending
    @pending_bids = Bids.where(user_id: @user.id).where(status: "pending")
    #declined bids - profesional
    @declined_bids = Bids.where(user_id: @user.id).where(status: "declined")

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

  def show
    @bid = set_bid
    authorize @bid
  end

  def new
    @event = Event.find(params[:event_id])
    @bid = Bid.new
    authorize @bid
  end

  def create
    @event = Event.find(params[:event_id])
    @bid = Bid.new(bid_params)
    @bid.event = @event
    @bid.user = current_user
    @bid.price_cents = 100
    @bid.sku = @bid.event.name
    authorize @bid
    if @bid.save
      flash[:success] = "Bid saved!"
      order = Order.create!(bid_sku: @bid.sku, amount: @bid.price, state: 'pending', user: current_user)
      redirect_to new_order_payment_path(order)
      # redirect will be to payment when we get there
    else
      render "events/show"
    end
  end

  def accept
    authorize @bid
    @bid.update(bid_params)
    redirect_to event_path(@bid.event)
  end


  private

  def set_bid
    @bid = Bid.find(params[:id])
  end

  def bid_params
    params.require(:bid).permit(:price, :description, :status, :quote)
  end

  def edit
    authorize @bid
  end

  def update
    authorize @bid
  end

  def destroy
    authorize @bid
  end
end
