class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]

  def index
    @activities = Activity.all

    @markers = @activities.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude
      }

    @activity = Activity.new
    @activity_image = @activity.activity_images.build
  end

  def show
    @markers = [{
        lat: @activity.latitude,
        lng: @activity.longitude
      }]
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user

    if @activity.save
      params[:activity_images]['photo'].each do |a|
          @activity_image = @activity.activity_images.create!(:photo => a)
       end
      redirect_to activity_path(@activity)
    else
      render :index
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :address, :date, :description, :capacity, :user_id, :duration, :longitude, :latitude, activity_images: [:id, :activity_id, :photo])
  end
end
