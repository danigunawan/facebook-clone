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
  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  def friends
    friendships.map { |friendship| friendship.friend if friendship.confirmed }
  end

  def pending_friends
    friendships.map { |friendship| friendship.friend unless friendship.confirmed }.compact
  end

  def friend_requests
    inverse_friendships.map { |friendship| friendship.user unless friendship.confirmed }.compact
  end

  def confirm_friend(user)
    friendship = inverse_friendships.find { |frendship| frendship.user == user }
    friendship.confirmed = true
    friendship.save
    Friendship.create(user_id: id, friend_id: user.id, confirmed: true)
  end

  def delete_friend(user)
    request1 = Friendship.where(user_id: user.id, friend_id: id).first
    request2 = Friendship.where(user_id: id, friend_id: user.id).first
    a = request1.destroy if request1
    b = request2.destroy if request2
    a || b
  end

  def friend?(user)
    friends.include?(user)
  end

  def not_friends?(user)
    !friends.include?(user)
  end
end
