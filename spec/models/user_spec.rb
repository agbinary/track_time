require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  describe "ActiveModel validations" do
    it { should validate_presence_of(:uid) }
    it { should validate_presence_of(:nickname) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:token) }
    it { should validate_presence_of(:secret) }
  end

  describe "ActiveRecord associations" do
    it { should have_many(:activities) }
    it { should have_many(:projects) }
  end
end
