# frozen_string_literal: true

FactoryBot.define do
  factory :venue do
    trait :puzl do
      name     { "Puzl" }
      address  { 'bulevard "Cherni Vrah", 57' }
      place_id { "ChIJHQN_hlmEqkARFCw8fo5gJsQ" }
    end

    trait :somewhere do
      name     { "N-working" }
      address  { "Somewhere rue" }
      place_id { "somewhere_google_place_id" }
    end

    trait :random do
      name     { SecureRandom.hex }
      address  { SecureRandom.hex }
      place_id { SecureRandom.hex }
    end
  end

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
  end

  factory :company do
    trait :fan_see do
      name        { "Fan See" }
      description { "We give you the bestest fans you'll ever see!" }
    end
  end

  factory :job do
    trait :fan_see do
      association :company, factory: [:company, :fan_see]

      title       { "Fan Seeler" }
      description { "Bestern auf dem fanseelers!" }
    end
  end
end
