# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(first_name: 'Lorem', last_name: 'IPsum', email: 'lorem@ipsum.com', password: 'foobar')
    @post = @user.posts.build(content: 'hello')
  end

  test 'user without parameters should be invalid' do
    @user = User.new
    assert_not @user.valid?
  end

  test 'user association with post' do
    assert @post.creator == @user
  end

  test 'users further association with post' do
    assert @user.posts.include?(@post)
  end
end
