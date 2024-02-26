FactoryBot.define do
  factory :position do
    name { Faker::Name.name }
    career { 2 }
    contract { 0 }
    city { Faker::Address.city }
    state { Faker::Address.state }
    summary { Faker::Lorem.paragraph }
    company
  end
end