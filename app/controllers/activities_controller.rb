class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]
  before_action :set_categories, :set_age_group, only: [:index, :show]

  def index

    # ---- Created new variable with empty array -----------------

    @cat_ages = []
    @categories.each { |c| @cat_ages << c }
    @age_group.each { |a| @cat_ages << a }

    @activities = Activity.all
    price_filter = params.dig(:sort, :price)

    @activities = @activities.order(price_cents: :asc) if price_filter == "Lowest"
    @activities = @activities.order(price_cents: :desc) if price_filter == "Highest"
    if params["popular"] == "true"
      @activities = @activities.sort_by { |activity| activity.favorites.size }.reverse
    end

    # ---- Search by DATE -----------------

    if params.dig(:filter_date, :date).present?
      date_search = params.dig(:filter_date, :date).to_date
      @activities = Activity.where("date::date = ?", date_search)
    elsif params.dig(:search_by, :name).present?

      # ---- Search by ----------------

      search = params.dig(:search_by, :name)
      sql_query = "address ILIKE :name OR title ILIKE :name OR category ILIKE :name OR age_group ILIKE :name"
      @activities = Activity.where(sql_query, name: "%#{search}%")
    else
      @activities = Activity.all if @activities.empty?
    end

    # ---- Merged categories and age_groups filtering -----------------

    if params[:sort]
      if params[:sort][:select_categories_and_ages]
        parameters = params[:sort][:select_categories_and_ages].reject(&:empty?)
        @activities = []
        @cat = []
        @agroup = []
        parameters.each { |cag| @categories.include?(cag) ? @cat << cag : @agroup << cag }
        @cat.each { |c| @activities << Activity.where(category: c) }
        @activities = @activities.flatten
        if @activities.any?
          @agroup.each do |ag|
            @activities = @activities.select { |activity| activity.age_group == ag }
          end
        else
          @agroup.each do |ag|
            @activities << Activity.where(age_group: ag)
          end
          @activities = @activities.flatten
        end
        @activities = Activity.all if @activities.empty?
      end
    end

    # ---- MAP MARKERS -----------------


    @markers = @activities.map do |activity|
      if activity.latitude && activity.longitude
        {
          lat: activity.latitude,
          lng: activity.longitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { activity: activity })
        }

        @activity = Activity.new
        @activity_image = @activity.activity_images.build
      end
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
      if params[:activity_images].present?
        params[:activity_images]['photo'].each do |a|
          @activity_image = @activity.activity_images.create!(:photo => a)
        end
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
    params.require(:activity).permit(:title, :address, :age_group, :date, :description, :category, :capacity, :price, :user_id, :rating, :duration, :longitude, :latitude, activity_images: [:id, :activity_id, :photo])
  end

  def set_categories
    @categories = ["Courses", "Creative", "Mindfulness", "Music & Dance", "Playdates", "Outdoors", "Indoors", "Sports", "Farm Day", "Culture"]
  end

  def set_age_group
    @age_group = ["Babies", "Toddlers", "3-5 years", "6-9 years", "+9 years", "For all"]
  end
end

