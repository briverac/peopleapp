class PersonMailer < ApplicationMailer
	include Resque::Mailer
	default from: 'notifications@peopleapp.com'
	def new_person(created_person,person)
		@created_person = created_person
		@person = person
		mail(to: @person["email"], subject: 'People App - New person added')
	end
	def deleted_person(created_person,person)
		@created_person = created_person
		@person = person
		mail(to: @person["email"], subject: 'People App - New person added')
	end
end
