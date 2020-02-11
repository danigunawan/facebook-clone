# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.order(created_at: :desc)
    @post = Post.new
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(content: params[:post][:content])
    redirect_to root_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
