# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.where(post_id: @post.id, liker_id: current_user.id)
    if @like.exists?
      Like.destroy(@like.ids)
    else
      @like = current_user.likes.build(post_id: params[:post_id])
      @like.save

    end
    redirect_to root_path
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to root_path
  end

  private

  def check; end
end
