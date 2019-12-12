# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers


  test 'should see only sign in unless signed in' do
    get new_user_session_path
    assert_response :success
  end
end
