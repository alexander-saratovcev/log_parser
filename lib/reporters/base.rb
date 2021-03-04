# frozen_string_literal: true

module Reporters
  class Base
    def initialize(records, target = $stdout)
      @records = records
      @target = target
    end

    def call
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    private

    attr_reader :records, :target

    def header
      "=================#{self.class::REPORT_NAME}================="
    end

    def print_report
      target.puts header
      yield
      target.puts footer
    end

    def footer
      "==============END #{self.class::REPORT_NAME}================"
    end
  end
end
