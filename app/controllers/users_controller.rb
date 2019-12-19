# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def home; end

<<<<<<< HEAD
# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def home; end

  def index 
    @user = User.all
  end

  def new; end
