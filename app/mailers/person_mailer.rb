# Class used to send the emails to a person when a person is registered or deleted
class PersonMailer < ApplicationMailer
	include Resque::Mailer
	default from: 'notifications@peopleapp.com'
# Public: Send an email to a user, when a person is registered in the app.
#
# created_person the new person registered in the app
# person the actual person of the system that will receive the email
	def new_person(created_person,person)
		@created_person = created_person
		@person = person
		mail(to: @person["email"], subject: 'People App - New person added')
	end
# Public: Send an email to a user, when a person is deleted from the app
#
# deleted_person the person deleted from the app
# person the actual person of the system that will receive the email
	def deleted_person(deleted_person,person)
		@deleted_person = deleted_person
		@person = person
		mail(to: @person["email"], subject: 'People App - New person added')
	end
end
