# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    trait :fan_see do
      name        { "Fan See" }
      description { "We give you the bestest fans you'll ever see!" }
    end
  end
end
