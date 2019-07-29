class FollowersController < ApplicationController
  def followers
    @user = User.find(params[:user_id])
    if @user == current_user
      @followers = Follower.where(user: current_user)
    else
      @followers = Follower.where(user: @user.id)
    end
  end

  def following
   @user = User.find(params[:user_id])
   if @user == current_user
     @following = Follower.where(follower_id: current_user)
   else
     @following = Follower.where(follower_id: @user.id)
   end
  end

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
      format.html { redirect_to user_path(@user) }
      format.js
    end
  end
end
