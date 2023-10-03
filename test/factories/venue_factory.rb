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

    trait :online do
      name   { "Online Conference" }
      online { true }
    end
  end
end
