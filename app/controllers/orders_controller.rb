class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @user = User.find(params[:id])
    authorize @order
  end
end
