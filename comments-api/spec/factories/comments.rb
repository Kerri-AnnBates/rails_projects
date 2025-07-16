FactoryBot.define do
  factory :comment do
    account
    content { 'This is a comment' }
    score { 1 }

    trait :reply do
      comment_type { :reply }
      parent_id { 2 }
    end
  end
end