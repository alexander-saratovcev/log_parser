# frozen_string_literal: true

module Entities
  class Base
    def initialize
      @errors = []
    end

    attr_reader :errors

    def valid?(validators = [])
      validators.each do |validator|
        result = validator.new(self)
        collect_errors(result.errors) unless result.valid?
      end

      errors.empty?
    end

    private

    def collect_errors(validation_errors)
      errors.concat(validation_errors)
    end
  end
end
