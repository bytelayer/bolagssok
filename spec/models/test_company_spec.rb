require "spec_helper"

describe Company do
  it "has a valid factory" do
    FactoryGirl.create(:company).should be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:company, name: nil).should_not be_valid
  end

  it "is invalid without a number"
end
