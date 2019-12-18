# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  include Devise::Test::IntegrationHelpers

  let!(:user) do
    User.create(first_name: 'Test', email: 'test@test.com',
                password: 'password', password_confirmation: 'password')
  end

  let!(:post) { Post.create(user_id: user.id, content: 'Post Content') }

  describe 'Likes Create method' do
    scenario 'Default likes in a post should be none' do
      sign_in user
      expect(Like.count).to eql(0)
      visit root_path
      expect(page).to have_content('0 Likes')
    end

    scenario 'Logged in user should successfully like the post' do
      sign_in user
      Like.create(liker_id: user.id, post_id: post.id)
      expect(Like.count).to eql(1)
      sign_out user
    end

    scenario 'Logged in user should successfully un-like the post' do
      sign_in user
      visit root_path
      click_on 'Like'
      expect(page).to have_content('1 Like')
      click_on 'Like'
      expect(page).to have_content('0 Likes')
    end
  end
end
