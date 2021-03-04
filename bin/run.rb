#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../config/environment'

Interactors::GenerateReport.new(ARGV[0]).call
