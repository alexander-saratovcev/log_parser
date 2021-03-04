# frozen_string_literal: true

module Validators
  class FileExtension < Base
    def initialize(file_path)
      @file_path = file_path
      super()
    end

    attr_reader :file_path

    def valid?
      allowed_extension? &&
        errors.empty?
    end

    private

    ALLOWED_EXTENSIONS = %w[log txt].freeze

    private_constant :ALLOWED_EXTENSIONS

    def allowed_extension?
      return true if ALLOWED_EXTENSIONS.include?(file_path.extension)

      errors << "extension should be one of [#{ALLOWED_EXTENSIONS.join(' ')}]"
    end
  end
end
