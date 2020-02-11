# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get new_user_session_path
    sign_in users(:user_007)
    post user_session_url
  end

  test 'should get root path after signing in' do
    get root_path
    assert_response :success
  end

  test 'should get a user page' do
    get users_path
    assert_response :success
  end
end
