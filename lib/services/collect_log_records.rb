# frozen_string_literal: true

module Services
  class CollectLogRecords
    def initialize(file)
      @file = file
    end

    def call
      File.foreach(file.path).map do |line|
        path, ip = line.split
        Entities::LogRecord.new(path: path, ip: ip)
      end
    end

    private

    attr_reader :file
  end
end
