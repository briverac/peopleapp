# this class evaluates that a picture is valid URL
class UrlValidator < ActiveModel::EachValidator
# Public: Validates the picture
# record - the ActiveRecord owner of the value
# attribute - the name of the attribute that will be validate
# value - the value that will be validate
#
# Returns true if the picture is a valid URL.
	def validate_each(record, attribute, value)
    unless /(http:\/\/|https:\/\/).+\..+/.match(value)
      record.errors[attribute] << (options[:message] || "must be a valid url, should content 'http://' or 'https://'")
    end
  end
end