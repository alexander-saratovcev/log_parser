# frozen_string_literal: true

module Entities
  class File < Base
    def initialize(path)
      @path = path
      super()
    end

    attr_reader :path

    def extension
      path.split('.').last
    end

    def file_name
      path.split('/').last.delete(".#{extension}")
    end

    def valid?(validators = [Validators::FileExists, Validators::FileExtension])
      super(validators)
    end
  end
end
