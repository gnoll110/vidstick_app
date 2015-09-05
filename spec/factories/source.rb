FactoryGirl.define do
  factory :source do
    trait :dwhelper do
      id   1
      path "/home/noel/dwhelper"
    end

    trait :downloads do
      id   2
      path "/home/noel/Downloads"
    end
  end
end
