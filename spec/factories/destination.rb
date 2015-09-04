FactoryGirl.define do
  factory :destination do
    trait :dev do
      id   4
      path "dev"
    end

    trait :eco do
      id   20
      path "eco"
    end

    trait :dev_rails do
      id   5
      path "dev/rails"
    end
  end
end
