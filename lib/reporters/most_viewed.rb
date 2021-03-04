# frozen_string_literal: true

module Reporters
  class MostViewed < Base
    def call
      print_report { records.each { |url, count| target.puts "#{url} #{count} visits" } }
    end

    private

    attr_reader :records

    REPORT_NAME = 'Most page views'
  end
end
