# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :liker, class_name: 'User', foreign_key: 'liker_id'
  belongs_to :post
end
