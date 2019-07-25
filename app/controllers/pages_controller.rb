class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @categories = ["Courses", "Creative", "Midnfulness", "Music & Dance", "Playdates", "Outdoors", "Sports", "Farm Day"]
  end
end
