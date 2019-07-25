class OrdersController < ApplicationController
  before_action :set_activity, only: [:create]

  def show
    @order = Order.find(params[:order_id])
  end

  def create
    activity = Activity.find(params[:activity_id])
    tickets = params[:tickets].to_i
    amount = tickets * activity.price
    order = Order.new(user: current_user, activity: activity, number_of_tickets: tickets, status: "pending", amount: amount)

    if order.save
      redirect_to new_order_payment_path(order)
    else
      render :new
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to dashboard_path
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end
end
