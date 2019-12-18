# frozen_string_literal: true

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
  describe 'Sending friendship' do
    scenario 'User can send a friendship request' do
      sign_in user
      visit users_path
      expect(page).to have_content('Test2')
      click_on 'Send Friend Request'
      expect(page).to have_content('You just sent a request')
      page.should have_selector(:link_or_button, 'Cancel Request')
      expect(Friendship.count).to eql(1)
      expect(Friendship.first.confirmed).to be_falsey
      sign_out user
    end
  end

  it 'accepts a request for friendship and can decline it' do
    expect(Friendship.count).to eql(0)
    Friendship.create(user_id: user.id, friend_id: user2.id)
    expect(Friendship.count).to eql(1)
    expect(Friendship.first.confirmed).to be_falsey
    sign_in user
    visit root_path
    page.should have_selector(:link_or_button, 'Friends')
    expect(user2.friend_requests.count).to eql(1)
    user2.confirm_friend(user)
    click_link('Friends')
    page.should have_selector(:link_or_button, user.first_name)
    Friendship.first.destroy
    visit '/users'
    page.should have_selector(:link_or_button, 'Send Friend Request')
    expect(Friendship.count).to eql(0)
    sign_out user2
  end
end
