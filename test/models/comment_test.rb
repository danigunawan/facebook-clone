# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = User.create(first_name: 'Lorem', last_name: 'IPsum', email: 'lorem@ipsum.com', password: 'foobar')
    @post = Post.create(content: 'Lorem ipsum', user_id: @user.id)
    @comment = Comment.create(post_id: @post.id, commenter_id: @user.id, comment: 'hello')
  end

  test 'comment should be valid' do
    assert @comment.valid?
  end

  test 'comment should be present' do
    @comment.comment = '   '
    assert_not @comment.valid?
  end

  test 'comment association to user' do
    assert @comment.commenter = @user
  end

  test 'comment association to post' do
    assert @comment.post = @post
  end
end
