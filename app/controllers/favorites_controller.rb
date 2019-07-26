class FavoritesController < ApplicationController
  def create
    @activity = Activity.find(params[:activity_id])
    current_user.favorites.create(activity: @activity)

    respond_to do |format|
      format.html { redirect_to @activity }
      format.js
    end
  end

  def destroy
    favorite = Favorite.find(params[:id])
    @activity = favorite.activity
    favorite.destroy

    respond_to do |format|
      format.html { redirect_to @activity }
      format.js { render :create }
    end
  end
end
