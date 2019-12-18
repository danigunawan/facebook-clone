# frozen_string_literal: true

module UsersHelper

  def  check_status(user)
   stat = Friendship.where(user_id: user.id, friend_id: current_user.id ) || Friendship.where(user_id: current_user.id, friend_id: user.id )
   return unless stat.empty?
   link_to user.first_name ,user
end


def request_form(user)
    return unless check_status(user)
    render 'friendships/request' ,:user_id => user.id
end

def name(user)
user.first_name + ' ' + user.last_name

end
end
