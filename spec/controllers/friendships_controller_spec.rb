require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  include Devise::Test::IntegrationHelpers

  let!(:user) do
    User.create(first_name: 'Test', last_name: 'LastName', email: 'test@test.com',
                password: 'password', password_confirmation: 'password')
  end

  let!(:user2) do
    User.create(first_name: 'Test2', last_name: 'LastName', email: 'test2@test.com',
                password: 'password', password_confirmation: 'password')
  end

  # Friendship tests 
  # User can send friendship request
  # Requestee can accept the friendship request
  # Requestee can decline the request
  # After accepting request, requester show on friends list
  # After declining request, requester does not show on friends list
  describe 'Sending friendship' do
    scenario 'User can send a friendship request' do
      sign_in user
      visit users_path
      expect(page).to have_content('Test2')
      click_on 'Send Friend Request'
      expect(page).to have_content('You just sent a request')
      expect(Friendship.count).to eql(1)
      expect(Friendship.first.confirmed).to be_falsey
      sign_out user
    end
  end

  describe 'Accepting friendship' do
    scenario 'User can successfully accept a friendship' do
      sign_in user2
      visit root_path
      page.should have_selector(:link_or_button, 'Notifications')
      find_link('Notifications').click
      # user_2.confirm_friend(user_1)
      # visit '/users'
      # page.should have_selector(:link_or_button, 'Cancel Friendship')
      # expect(Friendship.count).to eql(1)
      # expect(Friendship.first.confirmed).to be true
      # Friendship.first.destroy
      # visit '/users'
      # page.should have_selector(:link_or_button, 'Friend Request')
      # expect(Friendship.count).to eql(0)
      # sign_out user_2
    end
  end

  # describe 'Declining a friendship' do
    
  # end
end
