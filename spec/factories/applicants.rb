FactoryBot.define do
  factory :applicant do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
    resume { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'resumes', 'resume.pdf')) }
    position
    user
  end
end