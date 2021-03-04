# frozen_string_literal: true

module Validators
  class Base
    def initialize
      @errors = []
    end

    attr_reader :errors

    def valid?
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
