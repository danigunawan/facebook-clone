FactoryBot.define do
  factory :comment do
    post_id { 1 }
    commenter_id { 1 }
    comment { "MyText" }
  end
end
