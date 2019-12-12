# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should redirect to sign in page if not signed in ' do
    get users_path
    assert_redirected_to new_user_session_path
  end
end
