# frozen_string_literal: true

module Interactors
  class GenerateReport
    def initialize(file_path)
      @file = Entities::File.new(file_path)
    end

    def call
      raise Errors::ValidationError, file.errors unless file.valid?

      Services::PrintReport.new(log_records, Strategies::SortMostViewed, Reporters::MostViewed).call
      Services::PrintReport.new(log_records, Strategies::SortUniq, Reporters::UniqViews).call
    end

    private

    attr_reader :file

    def log_records
      @log_records ||= Services::CollectLogRecords.new(file).call
    end
  end
end
