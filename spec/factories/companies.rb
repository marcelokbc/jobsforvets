FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    url { Faker::Internet.url }
    user
    trait :with_logo do
      after :build do |company|
        company.logo.attach(io: File.open(Rails.root.join('spec', 'support', 'assets', 'logo.png')), filename: 'logo.png', content_type: 'image/png')
      end
    end
  end
end