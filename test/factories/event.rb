# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    create_with_venue = -> do
      Event.create_with_venue time: time, description: description, venue_id: venue.id
    end

    trait :impulsive do
      association :venue, factory: [:venue, :somewhere]

      time        { Time.current }
      description { "Impulsive event" }

      initialize_with(&create_with_venue)
    end

    trait :random do
      association :venue, factory: [:venue, :random]

      time        { Time.current }
      description { SecureRandom.hex }

      initialize_with(&create_with_venue)
    end

    trait :published do
      published_at { Time.current }
    end
  end
end
