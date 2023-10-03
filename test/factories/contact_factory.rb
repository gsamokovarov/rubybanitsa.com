# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    trait :fan_see do
      association :company, factory: [:company, :fan_see]

      name  { "Fan Cho" }
      email { "cho@fan_see.com" }
    end
  end
end
