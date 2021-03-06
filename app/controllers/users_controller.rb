class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :edit, :update, :show, :dashboard]
  #before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
    @users = policy_scope(User).order(created_at: :desc)
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
    @accepted_bids = @user.bids.where(status: "accepted").where(user_id: @user.id)
    #pending
    @pending_bids = @user.bids.where(status: "pending")
    #declined bids - profesional
    @declined_bids = @user.bids.where(status: "declined")

    #list of events the professional has bid on
    @professional_events = Bid.where(user_id: @user.id)


  #HOST

   #list all host events
    @host_events = Event.where(user_id: @user)
    @bids = @host_events.map { |event| event.bids }.flatten.select { |bid| bid.status == "accepted" }

    #bids recieved for each event
    @host_bids = Bid.where(user_id: @user.id)

    @host_bookings = Bid.where(event_id: @host_events)
    @host_bids_test = Bid.where(status: "accepted")


    # @host_bookings = @user.events.bids.where(status: "accepted").where(user_id: @user.id)


    # @host_bids_events = event.bids.where(status: "accepted")
    # raise
    # @hostbooking = @user.event.bids.where(status: "accepted").where(event_id: @event.id)


  #BOTH
    #reviews made by user
    @reviews = Review.where(reviewed_user_id: @user.id)

    # respond_to do |format|
    #   format.html #looks for views/users/dashboard.html.erb
    #   format.js   #looks for views/users/dashboard.js.erb
    # end
    def past
      @datetime = bid.event.date
      @datetime.to_date.past? # => false (only based on date)
      #datetime <= Date.today
    end

    def future
      @datetime = bid.event.date
      @datetime.to_date.future? # => false  (only based on date)
      #datetime >= Date.today
    end



  end




  def host_events_dashboard
    @user = current_user
    authorize @user
      #HOST

   #list all host events
    @host_events = Event.where(user_id: @user.id)
  end

  def show
    @user = User.find(params[:id])
    @review = Review.new
    # @userbids = @bid.user
    # @events = []
    # @userbids.events.each do |event|
    #   @events << event
    # end
    @reviews = Review.where(reviewed_user: @user)
    authorize @user
  end



  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    # raise
    authorize @user
    if @user.update_attributes(user_params)
      unless @user.services.map(&:id).include?(params[:user][:service_ids])
        UserService.create(user: @user, service_id: params[:user][:service_ids])
      end
      # raise
      redirect_to dashboard_path
    else
      # raise
      render :edit
    end
    # raise
  end

  private

  def professional?
    @user = current_user.professional
  end

  def accepted
    @user.bid.accepted == true
  end

  def declined
    @user.bid.declined == true
  end


  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :professional, :photo)
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
