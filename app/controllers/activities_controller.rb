class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]
  before_action :set_categories, :set_age_group, only: [:index]

  def index
    @activities = Activity.all

    price_filter = params.dig(:sort, :price)
    @activities = @activities.order(price_cents: :asc) if price_filter == "Lowest"
    @activities = @activities.order(price_cents: :desc) if price_filter == "Highest"
    @activities = @activities.sort_by { |activity| activity.favorites.size }.reverse if params["popular"] == "true"

    @markers = @activities.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { activity: activity })
      }

      @activity = Activity.new
      @activity_image = @activity.activity_images.build
    end
  end

  def show
    @markers = [{
      lat: @activity.latitude,
      lng: @activity.longitude,
      infoWindow: render_to_string(partial: "infowindow", locals: { activity: @activity })
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
    @activity = Activity.find(params[:id])
    @activity.destroy

    redirect_to dashboard_path
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :address, :age_group, :date, :description, :category, :capacity, :user_id, :rating, :duration, :longitude, :latitude, activity_images: [:id, :activity_id, :photo])
  end

  def set_categories
    @categories = ["Courses", "Creative", "Midnfulness", "Music & Dance", "Playdates", "Outdoors", "Indoors", "Sports", "Farm Day", "Culture"]
  end

  def set_age_group
    @age_group = ["Babies", "Toddlers", "3-5 years", "6-9 years", "+9 years", "For all"]
  end
end
