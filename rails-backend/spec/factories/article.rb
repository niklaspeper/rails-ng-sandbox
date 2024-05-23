# frozen_string_literal: true

# factorybot library in combination with faker used for generating test data
FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    status { Visible::VALID_STATUSES.sample }
    # everything with the trait :old will get the created_at timestamp 1.day.ago
    trait :old do
      created_at { 1.day.ago }
    end
  end
end
