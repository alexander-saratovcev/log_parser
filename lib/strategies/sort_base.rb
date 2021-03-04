# frozen_string_literal: true

module Strategies
  class Base
    def initialize(data)
      @data = data
    end

    attr_reader :data

    def call
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
