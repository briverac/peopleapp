require "test_helper"

describe Person do

  it "must be valid" do
  	person = FactoryGirl.build(:person, email: 'test@test.com')
    value(person).must_be :valid?
  end

  it "is invalid without a first_name" do
	  FactoryGirl.build(:person, first_name: nil).wont_be :valid?
	end

	it "is invalid without a last_name" do
	  FactoryGirl.build(:person, last_name: nil).wont_be :valid?
	end

	it "is invalid without an email" do
	  FactoryGirl.build(:person, email: nil).wont_be :valid?
	end

	it "is invalid without a birthdate" do
	  FactoryGirl.build(:person, birthdate: nil).wont_be :valid?
	end

	it "is invalid without a picture" do
	  FactoryGirl.build(:person, picture: nil).wont_be :valid?
	end

	it "is invalid with a future date for birthdate" do
	  FactoryGirl.build(:person, birthdate: 1.day.from_now).wont_be :valid?
	end

	it "is invalid with a gender different to Male or Female" do
		FactoryGirl.build(:person, gender: 'Other').wont_be :valid?
	end

	it "is invalid with an email that is invalid" do
		FactoryGirl.build(:person, email: 'Other').wont_be :valid?
	end

	it "is invalid with a picture that is not an url" do
		FactoryGirl.build(:person, picture: 'Other').wont_be :valid?
	end

	it "is invalid with a first_name longer than 75" do
		FactoryGirl.build(:person, first_name: (1..43).to_a.join('')).wont_be :valid?
	end

	it "is invalid with a last_name longer than 75" do
		FactoryGirl.build(:person, last_name: (1..43).to_a.join('')).wont_be :valid?
	end

	it "is invalid with a job longer than 75" do
		FactoryGirl.build(:person, job: (1..43).to_a.join('')).wont_be :valid?
	end

	it "is invalid with an email longer than 254" do
		FactoryGirl.build(:person, last_name: (1..121).to_a.join('')).wont_be :valid?
	end

	it "is invalid with an email that already exists" do
		FactoryGirl.create(:person, email: 'test@test.com')
		FactoryGirl.build(:person, email: 'test@test.com').wont_be :valid?
	end

	it "should return the complete name of a person" do
		person = FactoryGirl.build(:person, first_name: 'Bryan', last_name: 'Rivera')
		assert_equal person.complete_name, 'Bryan Rivera'
	end

	it "should return the correct age of a person" do
		person = FactoryGirl.build(:person, birthdate: 5.year.ago)
		assert_equal person.age, 5
	end

end
