# Public: This model holds the information of the People
class Person < ActiveRecord::Base
	validates :first_name, :last_name, presence: true, length: {maximum: 75}
	validates :email, presence: true, length: {maximum: 254}, uniqueness: true, email: true
	validates :job, length: {maximum: 75}
	validates :birthdate, presence: true, past_date: true
	validates_inclusion_of :gender, :in => %w( Male Female ), message: 'must choose'
	validates :picture, url: true, presence: true

# Public: Get the actual age of a person based on his/her birthday
#
# Examples
#   person.age
#   # => 25
#
# Returns the age of a person.
	def age
		today = Date.today
		current_age = today.year - birthdate.year - ((today.month > birthdate.month || (today.month == birthdate.month && today.day >= birthdate.day)) ? 0 : 1)
	end
# Public: Get the complete name of a person
#
# Examples
#   person.complete_name
#   # => "Bryan Rivera"
#
# Returns the complete name of a person.
	def complete_name
		"#{first_name} #{last_name}"
	end
end
