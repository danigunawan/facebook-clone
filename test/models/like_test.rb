# frozen_string_literal: true

require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup
    @user = User.create(first_name: 'Lorem', last_name: 'IPsum', email: 'lorem@ipsum.com', password: 'foobar')
    @post = Post.create(content: 'Lorem ipsum', user_id: @user.id)
    @like = Like.create(post_id: @post.id, liker_id: @user.id)
  end

  test 'like is valid' do
    assert @like.valid?
  end

  test 'like relationship with user' do
    assert @like.liker = @user
  end

  test 'like relationship with post' do
    assert @like.post = @post
  end
end
