require 'active_model'

module ActiveModel
  module Validations
    class ContainerNumberValidator < ::ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        record.errors.add(attribute, :invalid_container_number, message: 'is invalid') unless ::ContainerNumberValidator.validate(value)
      end
    end
  end
end
