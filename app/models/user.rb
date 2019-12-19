# frozen_string_literal: true

class User < ApplicationRecord
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :likes, class_name: 'Like', foreign_key: 'liker_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'commenter_id'
end
