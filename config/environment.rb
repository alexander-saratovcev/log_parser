# frozen_string_literal: true

require 'bundler'
environment = ENV.fetch('PARSER_ENV', 'development').to_sym
Bundler.require(:default, environment)

Dir['./lib/**/*.rb'].each { |f| require f }
