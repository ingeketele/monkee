class ActivityReviewsController < ApplicationController
  def create
    activity_review = ActivityReview.new(activity_review_params)
    activity_review.order = Order.find(params[:order_id])

    if activity_review.save
      redirect_to dashboard_path, notice: 'Review was successfully added.'
    else
      redirect_to dashboard_path, alert: activity_review.errors.full_messages.join(" - ")
    end
  end

  def update
    @activity_review = ActivityReview.find(params[:id])
    @activity_review.update(activity_review_params)
  end

  def destroy
    @activity_review = ActivityReview.find(params[:id])
    @activity_review.destroy

    redirect_to dashboard_path
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

  def activity_review_params
    params.require(:activity_review).permit(:rating, :comment, :order_id)
  end
end
