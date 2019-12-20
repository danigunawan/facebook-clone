# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def index
    @requests = current_user.friend_requests
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friendship][:user_id])
    if @friendship&.save
      flash[:success] = 'Friend request succesfully sent'
      redirect_to users_path, notice: 'You just sent a request'
    else
      redirect_to users_path, notice: 'Friendship request already exists'
    end
  end
end
