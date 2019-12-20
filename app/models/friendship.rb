# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates :user_id, presence: true
  validates :friend_id, presence: true
  validate :check_request

  def check_request
    if Friendship.where(user_id: user_id, friend_id: friend_id).exists? ||
       Friendship.where(user_id: friend_id, friend_id: user_id).exists?
      errors.add(:unique_friend_request, 'Already requested!')

    elsif user_id == friend_id
      errors.add(:invalid_friend_request, 'Cannot befriend self')
    end
  end
end
