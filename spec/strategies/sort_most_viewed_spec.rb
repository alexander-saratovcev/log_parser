# frozen_string_literal: true

require 'strategies/sort_base'
require 'strategies/sort_most_viewed'
require 'entities/base'
require 'entities/log_record'
require 'faker'

RSpec.describe Strategies::SortMostViewed do
  subject(:strategy) { described_class.new(records) }

  let(:fixtures) do
    [
      ['/about', Faker::Internet.ip_v4_address],
      ['/about', Faker::Internet.ip_v4_address],
      ['/contact', Faker::Internet.ip_v4_address]
    ]
  end
  let(:records) { fixtures.map { |log| instance_double('Entities::LogRecord', path: log[0], ip: log[1]) } }
  let(:expected_output) { { '/about' => 2, '/contact' => 1 } }

  describe '#call' do
    it 'return correct hash' do
      expect(strategy.call).to eq(expected_output)
    end
  end
end
