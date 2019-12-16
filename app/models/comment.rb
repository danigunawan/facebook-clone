# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :commenter, class_name: 'User', foreign_key: 'commenter_id'
  validates :comment, presence: true
end
