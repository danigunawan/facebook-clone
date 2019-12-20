# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates :user_id, presence: true
  validates :friend_id, presence: true
  validate :check_request

  def check_request
    errors.add(:invalid_friend_request, 'Cannot befriend self') if user_id == friend_id
  end
end
