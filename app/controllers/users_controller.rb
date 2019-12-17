# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def home; end

  def index 
    @user = User.all
    @friendship = Friendship.new
  end

  def new; end

  def create; end

  def show
    @user = User.find(params[:id])
  end
end
