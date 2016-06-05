class PastDateValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
    unless value.nil? || value < Date.today
      record.errors[attribute] << (options[:message] || "must be earlier than today")
    end
  end
end