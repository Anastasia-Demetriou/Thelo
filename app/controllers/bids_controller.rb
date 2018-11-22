class BidsController < ApplicationController
  before_action :set_bid, only: [:accept, :show, :edit, :update, :destroy]

  def index
    @bids = policy_scope(Bid).order(created_at: :desc)
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

  def decline
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
