##
# this is a test
class EmailValidator < ActiveModel::EachValidator
# Public: Get the actual age of a person based on his/her birthday
# record - the ActiveRecord owner of the value
# attribute - the name of the attribute that will be validate
# value - the value that will be validate
# Examples
#   person.age
#   # => 25
#
# Returns the age of a person.
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is invalid")
    end
  end
end