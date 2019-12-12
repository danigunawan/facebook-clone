require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do 
    get users_path
    assert_redirected_to  new_user_session_path
  end 
end
