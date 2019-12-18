# frozen_string_literal: true

module UsersHelper

  def check_status(user)
   current_user.pending_friends.include?(user) && !current_user.friends.include?(user) 
end


def request_form(user)
    render 'friendships/request' ,:user_id => user.id if user!= current_user && !current_user.friends.include?(user) && 
    !user.pending_friends.include?(current_user)
end

def naming (user)
  return unless user!= current_user && !current_user.friends.include?(user)  && !user.pending_friends.include?(current_user)
  link_to name(user), user
end
def name(user)
user.first_name + ' ' + user.last_name 

end
end
