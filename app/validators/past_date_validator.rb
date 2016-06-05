# this class evaluates that a birthdate is earlier than today
class PastDateValidator < ActiveModel::EachValidator
# Public: Validates the birthdate
# record - the ActiveRecord owner of the value
# attribute - the name of the attribute that will be validate
# value - the value that will be validate
#
# Returns true if the birthday is valid.
	def validate_each(record, attribute, value)
    unless value.nil? || value < Date.today
      record.errors[attribute] << (options[:message] || "must be earlier than today")
    end
  end
end