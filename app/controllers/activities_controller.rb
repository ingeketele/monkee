class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]

  def index
  end

  def show
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
