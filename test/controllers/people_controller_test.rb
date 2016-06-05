require "test_helper"

describe PeopleController do
	def setup
		FactoryGirl.create(:person)
	end

  it "should get index" do
    get :index
    assert_response :success
    assert_includes @response.body, 'People'
  end

  it "should get show" do
    get :show, id: Person.last.id
    assert_response :success
    assert_includes @response.body, 'Personal information'
  end

  it 'shoud create a person' do
  	assert_difference('Person.count') do
	  	xhr :post, :create, person: {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, gender: ['Male','Female'].sample, birthdate: Faker::Date.between(60.years.ago, 1.day.ago), picture: Faker::Avatar.image}
	  end
	  assert_difference 'ActionMailer::Base.deliveries.size', +3 do
      xhr :post, :create, person: {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, gender: ['Male','Female'].sample, birthdate: Faker::Date.between(60.years.ago, 1.day.ago), picture: Faker::Avatar.image}
    end
	  assert_equal "text/javascript", @response.content_type
	  assert_response :success
  end

  it 'shoud not create a person with missing params' do
  	assert_difference('Person.count',0) do
	  	xhr :post, :create, person: {last_name: Faker::Name.last_name, email: Faker::Internet.email, gender: ['Male','Female'].sample, birthdate: Faker::Date.between(60.years.ago, 1.day.ago), picture: Faker::Avatar.image}
	  end
	  assert_equal "text/javascript", @response.content_type
  end

  it 'shoud delete a person' do
  	assert_difference('Person.count', -1) do
  		delete :destroy, id: Person.last.id
  	end
  	FactoryGirl.create(:person)
  	assert_difference 'ActionMailer::Base.deliveries.size', +1 do
      post :destroy, id: Person.last.id
    end
  	assert_redirected_to people_path
  end
  
  it 'should update a person' do
  	put :update, id: Person.last, person: {first_name: 'Juan'}
  	assert_equal Person.last.first_name, 'Juan'
  	assert_redirected_to people_path
  end
end
