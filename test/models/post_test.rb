# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = User.create(first_name: 'Lorem', last_name: 'IPsum', email: 'lorem@ipsum.com', password: 'foobar')
    @post = Post.new(content: 'Lorem ipsum', user_id: @user.id)
  end

  test 'should be valid' do
    assert @post.valid?
  end

  test 'content should be present' do
    @post.content = '   '
    assert_not @post.valid?
  end

  test 'association to user' do
    assert @post.creator == @user
  end
end
