class PaymentsController < ApplicationController
  before_action :set_order

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
  end

  def new
    authorize @order
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @order.amount_cents,
      description:  "Payment for bid #{@order.bid_sku} for order #{@order.id}",
      currency:     gbp
    )

    @order.update(payment: charge.to_json, state: 'paid')
    authorize @order
    redirect_to order_path(@order)

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_order_payment_path(@order)
  end

  private

  def set_order
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
  end
end
