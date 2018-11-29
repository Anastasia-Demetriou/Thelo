class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @user = current_user
    authorize @order
  end
end
