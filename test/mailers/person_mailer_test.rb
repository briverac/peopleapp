require "test_helper"

describe PersonMailer do
  test "new person" do
    # Send the email, then test that it got queued
    old = FactoryGirl.create(:person, email: 'test@test.com')
    new_person = FactoryGirl.create(:person)
    email = PersonMailer.new_person(new_person,old).deliver
    assert_not ActionMailer::Base.deliveries.empty?
 
    # Test the body of the sent email contains what we expect it to
    assert_equal ['test@test.com'], email.to
    assert_equal 'People App - New person added', email.subject
    assert_includes email.body.to_s, 'has joined the application'
  end

  test "deleted person" do
    # Send the email, then test that it got queued
    old = FactoryGirl.create(:person, email: 'test@test.com')
    new_person = FactoryGirl.create(:person)
    email = PersonMailer.deleted_person(new_person,old).deliver
    assert_not ActionMailer::Base.deliveries.empty?
 
    # Test the body of the sent email contains what we expect it to
    assert_equal ['test@test.com'], email.to
    assert_equal 'People App - New person added', email.subject
    assert_includes email.body.to_s, 'has left the application'
  end
end
