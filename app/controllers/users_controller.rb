# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def home; end

  def index 
    @user = User.all
    @friendship = Friendship.new
  end

  def new; end

  def create; end

  def show
    @user = User.find(params[:id])
  end

  def confirm_friend
    friend = User.find(params[:id])
    if current_user.confirm_friend(friend)
      redirect_back fallback_location: current_user, notice: 'You acepted a frienship!'
    else
      redirect_to current_user, alert: 'You can not accept this friend!'
    end
  end

  def decline_friend
    friend = User.find(params[:id])
    req = Friendship.where(user_id: friend.id , friend_id: current_user.id).first
    redirect_back fallback_location: current_user, notice: 'You declined a frienship!' if req.destroy
  end

  def friends 
    @friends = current_user.friends
  end
end
