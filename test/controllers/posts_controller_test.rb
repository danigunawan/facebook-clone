require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do 
    get new_user_session_path
    assert_response :success
  end
end
