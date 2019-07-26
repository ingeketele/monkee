class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @categories = ["Courses", "Creative", "Mindfulness", "Music & Dance", "Playdates", "Outdoors", "Indoors", "Sports", "Farm Day", "Culture"]
    @age_group = ["Babies", "Toddlers", "3-5 years", "6-9 years", "+9 years", "For all"]
  end
end
