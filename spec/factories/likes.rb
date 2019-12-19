# frozen_string_literal: true

FactoryBot.define do
  factory :like do
    liker_id { 1 }
    post_id { 1 }
  end
end
