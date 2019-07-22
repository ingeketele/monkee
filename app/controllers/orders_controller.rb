class OrdersController < ApplicationController
  before_action :set_activity, only: [:create]

  def show
    @order = Order.find(params[:order_id])
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :activity_id, :number_of_tickets)
  end

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end
end
