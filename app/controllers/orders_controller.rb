class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def create
    bid = Bid.find(params[:bid_id])
    order = Order.create!(bid_sku: bid.sku, amount: bid.price, state: 'pending', user: current_user)

    redirect_to new_order_payment_path(order)
    authorize order
  end
end
