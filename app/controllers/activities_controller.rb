class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]

  def index
    @activities = Activity.all

    @markers = @activities.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude
      }
    end
  end

  def show
    @markers = [{
        lat: @activity.latitude,
        lng: @activity.longitude
      }]
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
