class FriendshipsController < ApplicationController

    def index 
        @requests = current_user.friend_requests
    end

    def create
       @friendship = current_user.friendships.build(friend_id: params[:friendship][:user_id])
       if @friendship.save 
        flash[:success] = 'Friend request succesfully sent'
        redirect_to users_path
       else
        flash[:error] = 'Something went wrong with your request'
    end

    def update
        current_user.confirm_friend(params[:requester])
    end

    def destroy
    end
end

   
end
