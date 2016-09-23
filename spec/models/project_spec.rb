require 'rails_helper'

RSpec.describe Project, type: :model do
  it "has a valid factory" do
    expect(build(:project)).to be_valid
  end

  describe "ActiveModel validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user_id) }
  end

  describe "ActiveRecord associations" do
    it { should belong_to(:user) }
  end
end
