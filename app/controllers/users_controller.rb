class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  #before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = policy_scope(User).order(created_at: :desc)
  end

  def show
    @bid = Bid.find(params[:id])
    @user = @bid.user
    @events = []
    @user.events.each do |event|
      @events << event
    end

    # @professional_bids_accepted = []
    # @user.bid.accepted

    # @event_bids_accepted = []
    # @user.event.bid.accepted



    # @bids = []
    # @user.bids.each do |bid|
    #   @bids << bid.event
    # end


    authorize @user
  end


  def dashboard
    @user = current_user
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    @user.update(user_params)
    redirect_to dashboard_path

  end


  private

  def professional?
    @user = current_user.professional
  end

  def accepted
    @user.bid.accepted == true
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :bio, :professional)
  end

  # def bookings
  #   @bookings = []
  #   @events.confirmed_bid.each do |booking|
  #     @bookings << booking
  #   end
  # end

  # def set_user
  #   @user = User.find(params[:id])
  # end
end
