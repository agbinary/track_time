require 'rails_helper'

RSpec.describe Activity, type: :model do
  it "has a valid factory" do
    expect(build(:activity)).to be_valid
  end

  describe "ActiveModel validations" do
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
    it { should validate_presence_of(:date_report) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:track_type) }
    it { should validate_presence_of(:user_id) }
  end

  describe "ActiveRecord associations" do
    it { should belong_to(:user) }
    it { should belong_to(:project) }
  end
end
