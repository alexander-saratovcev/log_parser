# frozen_string_literal: true

module Services
  class PrintReport
    def initialize(data, sorter, reporter)
      @data = data
      @sorter = sorter
      @reporter = reporter
    end

    attr_reader :data, :sorter, :reporter

    def call
      reporter.new(sorted_records).call
    end

    private

    def sorted_records
      @sorted_records ||= sorter.new(data).call
    end
  end
end
