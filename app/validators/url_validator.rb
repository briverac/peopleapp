class UrlValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
    unless /(http:\/\/|https:\/\/).+\..+/.match(value)
      record.errors[attribute] << (options[:message] || "must be a valid url, should content 'http://' or 'https://'")
    end
  end
end