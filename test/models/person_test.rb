require "test_helper"

describe Person do
  let(:person) { FactoryGirl.create(:person) }

  it "must be valid" do
    value(person).must_be :valid?
  end
end
