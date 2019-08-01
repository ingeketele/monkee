class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]
  before_action :set_categories, :set_age_group, only: [:index, :show]

  def index
    # ---- Sort by PRICE -----------------
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
    elsif params.dig(:category).present? && params.dig(:age_group).present?
      ike_categories = params.dig(:category)
      ike_age_groups = params.dig(:age_group)
      category_activities = []
      ike_categories.each do |category|
        category_activities << Activity.where(category: category)
      end
      category_activities = category_activities.flatten
      activities = []
      ike_age_groups.each do |age|
        activities << category_activities.select { |activity| activity.age_group == age}
      end
      @activities = activities.flatten.uniq
      @activities = Activity.all if @activities.empty?
    elsif params.dig(:category).present? && params.dig(:age_group).nil?
      activities = []
      params.dig(:category).each do |category|
        activities << Activity.where(category: category)
      end
      @activities = activities.flatten
      @activities = Activity.all if @activities.empty?
    elsif params.dig(:category).nil? && params.dig(:age_group).present?
      activities = []
      params.dig(:age_group).each do |age|
        activities << Activity.where(age_group: age)
      end
      @activities = activities.flatten
      @activities = Activity.all if @activities.empty?
    else
      @activities = Activity.all if @activities.empty?
    end

    # ---- MAP MARKERS -----------------
    @markers = @activities.map do |activity|
      if activity.latitude && activity.longitude
        {
          lat: activity.latitude,
          lng: activity.longitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { activity: activity }),
          image_url: helpers.asset_url("monkee_marker_red.png")
        }

        # @activity = Activity.new
        # @activity_image = @activity.activity_images.build
      end
    end
  end

  def show
    @markers = [{
      lat: @activity.latitude,
      lng: @activity.longitude,
      infoWindow: render_to_string(partial: "infowindow", locals: { activity: @activity }),
      image_url: helpers.asset_url("monkee_marker_red.png")
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
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      if params[:activity_images].present?
        params[:activity_images]['photo'].each do |a|
          @activity_image = @activity.activity_images.update!(:photo => a)
        end
      end
      redirect_to activity_path(@activity)
    else
      render :show
    end

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

