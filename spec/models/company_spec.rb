require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:user) { create(:user) }

  it 'is valid with valid attributes' do
    company = build(:company, :with_logo, user: user)
    expect(company).to be_valid
  end

  it 'is not valid without a name' do
    company = build(:company, name: nil, user: user)
    expect(company).to_not be_valid
  end

  it 'is not valid without a user' do
    company = build(:company, user: nil)
    expect(company).to_not be_valid
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:url) }
  it { should belong_to(:user) }
  it { should have_one_attached(:logo) }
  it { should have_many(:positions) }

end
