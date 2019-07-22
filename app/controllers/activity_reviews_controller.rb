class ActivityReviewsController < ApplicationController
  def create
    @activity_review = Activity_review.new(activity_review_params)
    @activitiy_review.order = @order
    if @activity_review.save
      redirect_to dashboard_path, notice: 'Review was successfully added.'
    else
      redirect_to dashboard_path, alert: @activity_review.errors.full_messages.join(" - ")
    end
  end

  def update
    @activity_review = Activity_review.find(params[:id])
    @activity_review.update(activity_review_params)
  end

  def destroy
    @activity_review = Activity_review.find(params[:id])
    @activity_review.destroy
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

  def activity_review_params
    params.require(:review).permit(:rating, :comment, :order_id)
  end
end
