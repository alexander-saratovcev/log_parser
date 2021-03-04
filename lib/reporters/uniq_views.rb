# frozen_string_literal: true

module Reporters
  class UniqViews < Base
    def call
      print_report { records.each { |url, count| target.puts "#{url} #{count} uniq views" } }
    end

    private

    attr_reader :records

    REPORT_NAME = 'Uniq page views'
  end
end
