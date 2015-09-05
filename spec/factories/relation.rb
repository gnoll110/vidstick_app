FactoryGirl.define do
  factory :relation do
    trait :dev_patterns do
      id             1
      medium_id      1
      destination_id 4
    end

    trait :eco_permaculture do
      id             2
      medium_id      2
      destination_id 20
    end

    trait :dev_rails_hexagonal do
      id             3
      medium_id      3
      destination_id 5
    end
  end
end
