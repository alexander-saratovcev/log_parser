# frozen_string_literal: true

module Validators
  class FileExists < Base
    def initialize(file)
      @file_path = file.path
      super()
    end

    attr_reader :file_path

    def valid?
      file_exists? &&
        errors.empty?
    end

    def file_exists?
      return true if File.file?(file_path)

      errors << "#{file_path} is not a file"
    end
  end
end
