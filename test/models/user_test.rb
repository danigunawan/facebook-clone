require 'test_helper'

def setup 
  @user = User.new
end

class UserTest < ActiveSupport::TestCase
  test "password should be present (nonblank)" do 
    assert @user.valid? 
  end 
end
