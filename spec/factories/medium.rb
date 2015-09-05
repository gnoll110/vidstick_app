FactoryGirl.define do
  factory :medium do
    trait :patterns do
      id       1
      filename "Patterns.mp4"
    end

    trait :permaculture do
      id       2
      filename "Permaculture.mp4"
    end

    trait :hexagonal do
      id       3
      filename "Hexagonal Rails.mp4"
    end
  end
end
