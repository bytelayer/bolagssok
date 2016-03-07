require "spec_helper"

describe Company do
  it "has a valid factory" do
    expect(FactoryGirl.create(:company)).to be_valid
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:company, name: nil)).not_to be_valid
  end

  it "is invalid with a number not consisting of 10 digits" do
    expect(FactoryGirl.build(:company, name: "Test", number: "0123")).not_to be_valid
  end

  it "is invalid without a number" do
    expect(FactoryGirl.build(:company, name: "Test AB", number: nil)).not_to be_valid
  end
end
