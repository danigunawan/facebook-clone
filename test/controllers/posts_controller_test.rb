# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # Setup
  setup do
    get new_user_session_path
    sign_in users(:user_007)
    post user_session_url

    assert_response :success
  end

  test 'should get home' do
    get root_path
    assert_response :success
  end
end
