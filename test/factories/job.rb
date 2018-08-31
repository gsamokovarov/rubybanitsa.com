# frozen_string_literal: true

FactoryBot.define do
  factory :job do
    trait :fan_see do
      association :company, factory: [:company, :fan_see]

      title       { "Fan Seeler" }
      description { "Bestern auf dem fanseelers!" }
    end
  end
end
