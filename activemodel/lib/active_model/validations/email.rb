# frozen_string_literal: true

module ActiveModel
  module Validations
    class EmailValidator < EachValidator # :nodoc:
      def validate_each(record, attribute, value)
        unless /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/.match?(value)
          record.errors.add(attribute, message: options[:message] || "is not an email")
        end
      end
    end

    module HelperMethods
      # Validates that the specified attributes are in the format of email.
      #
      # For example:
      #
      #   class Person < ActiveRecord::Base
      #     validates_email_of :email
      #   end
      #
      def validates_email_of(*attr_names)
        validates_with EmailValidator, _merge_attributes(attr_names)
      end
    end
  end
end
