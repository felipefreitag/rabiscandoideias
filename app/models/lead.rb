class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "is not a valid email address") unless
      value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end
end

class Lead < ApplicationRecord
  validates :email, presence: true, email: true, uniqueness: { message: "already subscribed" }
end
