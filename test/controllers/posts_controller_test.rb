# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should see only sign in unless signed in' do
    get new_user_session_path
    assert_response :success
  end

  test 'should see sign up on click of sign up' do
    get new_user_registration_path
    assert_response :success
  end
end
