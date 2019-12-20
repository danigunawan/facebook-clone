# frozen_string_literal: true

class User < ApplicationRecord
  include Gravtastic
  gravtastic
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]
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

  def request_counter
    requests = self.friend_requests.count
    requests if requests > 0
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.password_confirmation = user.password
      user.first_name = auth.info.name
      user.last_name = ' '
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info'])
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.find_or_create_by_omniauth(auth_hash)
    where(email: auth_hash['info']['email']).first_or_create do |u|
      u.name = auth_hash['info']['name']
      u.password = SecureRandom.hex
    end
  end
end
