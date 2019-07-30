class FollowersController < ApplicationController
  def create
    @follower = Follower.new(user_id: params[:user_id], follower_id: current_user.id)
    @user = User.find(@follower.user.id)
    if @follower.save!
      respond_to do |format|
        format.html { redirect_to user_path(@follower.user_id) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'users/show' }
        format.js
      end
    end
  end

  def destroy
    @follower = Follower.find(params[:id])
    @user = @follower.user
    @follower.delete
    respond_to do |format|
      # byebug
      format.html { redirect_to @user }
      format.js { render :create }
    end
  end
end
