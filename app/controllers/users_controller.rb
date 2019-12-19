# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def home; end

<<<<<<< HEAD
  def index
=======
  def index 
>>>>>>> milestone-4
    @user = User.all
  end

  def new; end

  def create; end

  def show
    @user = User.find(params[:id])
  end
end
