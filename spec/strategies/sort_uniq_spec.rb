# frozen_string_literal: true

require 'strategies/sort_base'
require 'strategies/sort_uniq'
require 'entities/base'
require 'entities/log_record'
require 'faker'

RSpec.describe Strategies::SortUniq do
  subject(:strategy) { described_class.new(records) }

  let(:fixtures) do
    [
      ['/about', Faker::Internet.ip_v4_address],
      ['/about', Faker::Internet.ip_v4_address],
      ['/contact', '87.95.48.52'],
      ['/contact', '87.95.48.52'],
      ['/map', '45.12.35.64']
    ]
  end
  let(:records) { fixtures.map { |log| instance_double('Entities::LogRecord', path: log[0], ip: log[1], to_a: log) } }
  let(:expected_output) { { '/about' => 2, '/contact' => 1, '/map' => 1 } }

  describe '#call' do
    it 'return correct hash' do
      expect(strategy.call).to eq(expected_output)
    end
  end
end
