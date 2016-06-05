# this class evaluates that a email is valid
class EmailValidator < ActiveModel::EachValidator
# Public: Validates the email
# record - the ActiveRecord owner of the value
# attribute - the name of the attribute that will be validate
# value - the value that will be validate
#
# Returns true if the email is valid.
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is invalid")
    end
  end
end