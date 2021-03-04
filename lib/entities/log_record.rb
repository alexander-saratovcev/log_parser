# frozen_string_literal: true

module Entities
  class LogRecord
    def initialize(params)
      @path = params[:path]
      @ip = params[:ip]
    end

    attr_reader :path, :ip

    def to_a
      [path, ip]
    end
  end
end
