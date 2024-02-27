require 'rails_helper'

RSpec.describe Applicant, type: :model do
  let(:user) { create(:user) }
  let(:company) { create(:company, :with_logo, user: user) }
  let(:position) { create(:position, company: company) }

  it "is valid with valid attributes" do
    applicant = build(:applicant, position: position)
    expect(applicant).to be_valid
  end

  it "is not valid without atributtes" do
    applicant = Applicant.new
    expect(applicant).to_not be_valid
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:resume) }
  it { should validate_presence_of(:position_id) }

  it { should belong_to(:position) }
  it { should belong_to(:user) }

  it { should have_one_attached(:resume)}
end
