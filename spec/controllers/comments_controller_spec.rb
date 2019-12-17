# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
    include Devise::Test::IntegrationHelpers
    let!(:user) do
        User.create(first_name: 'Test', last_name: 'Hello', email: 'test@test.com',
                    password: 'password', password_confirmation: 'password')
      end
    
      let!(:post) { Post.create(user_id: user.id, content: 'Post Content') }
    
      let!(:thought) { Comment.create(commenter_id: user.id, post_id: post.id, comment: 'Testing Comments') }

      describe 'Comment create action' do
        it 'creates a valid comment for a logged in user on an existing post' do
          sign_in user
          expect(page).to have_content('Sign Out')
          visit "users/#{user.id}"
          expect(page).to have_content(thought.comment)
          expect(Comment.count).to eql(1)
          sign_out user
        end
    end
end
