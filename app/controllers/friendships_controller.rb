class FriendshipsController < ApplicationController

    def create
       @friendship = current_user.friendships.build(friend_id: params[:friendship][:user_id])
       if @friendship.save 
        flash[:success] = 'Friend request succesfully sent'
        redirect_to users_path
       else
        flash[:error] = 'Something went wrong with your request'
    end
end

   
end
