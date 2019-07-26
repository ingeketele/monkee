class PaymentsController < ApplicationController
  before_action :set_order

  def new
    if @order.activity.price == 0
      @order.update(status: "paid")
      redirect_to dashboard_path
    end
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email: params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @order.amount_cents,
      description: "Payment for activity #{@order.activity.title} for order #{@order.id}",
      currency: @order.amount.currency
    )

    @order.update(payment: charge.to_json, status: 'paid')
    redirect_to dashboard_path
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_order_payment_path(@order)
  end

  private

  def set_order
    @order = current_user.orders.where(status: 'pending').find(params[:order_id])
  end
end
