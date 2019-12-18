class FriendshipsController < ApplicationController

    def index 
        @requests = current_user.friend_requests
     
    end

    def create
       count = Friendship.where(user_id: current_user.id, friend_id: params[:friendship][:user_id] ).count
       @friendship = current_user.friendships.build(friend_id: params[:friendship][:user_id]) if count == 0
       if @friendship && @friendship.save 
        flash[:success] = 'Friend request succesfully sent'
        redirect_to users_path, notice: 'You just sent a request'
       else
        redirect_to users_path, notice: 'Your request already exists'
    end
end

    


   
end
