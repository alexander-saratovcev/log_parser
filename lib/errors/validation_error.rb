# frozen_string_literal: true

module Errors
  class ValidationError < StandardError
    def initialize(errors)
      super("Errors: #{errors.inspect}")
    end
  end
end
