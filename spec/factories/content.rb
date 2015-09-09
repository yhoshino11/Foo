FactoryGirl.define do
  factory :content do
    title Faker::Name.title
    text Faker::Lorem.sentence
  end
end
