# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    venue

    trait :impulsive do
      association :venue, factory: [:venue, :somewhere]

      time        { Time.current }
      description { "Impulsive event" }
    end

    trait :online do
      association :venue, factory: [:venue, :online]

      time        { Time.current }
      description { "Online event" }
    end

    trait :random do
      association :venue, factory: [:venue, :random]

      time        { Time.current }
      description { SecureRandom.hex }
    end

    trait :published do
      published_at { Time.current }
    end
  end
end
