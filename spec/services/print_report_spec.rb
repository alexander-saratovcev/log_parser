# frozen_string_literal: true

require 'services/print_report'
require 'entities/base'
require 'entities/log_record'
require 'reporters/base'
require 'reporters/most_viewed'
require 'strategies/sort_base'
require 'strategies/sort_uniq'

RSpec.describe Services::PrintReport do
  subject(:service) { described_class.new(records, sorter, reporter) }

  let(:first_record) { instance_double('Entities::LogRecord', path: '/about', ip: '87.95.42.63') }
  let(:second_record) { instance_double('Entities::LogRecord', path: '/contact', ip: '10.95.34.88') }
  let(:records) { [first_record, second_record] }
  let(:sorter) { Strategies::SortUniq }
  let(:reporter) { Reporters::MostViewed }
  let(:sorter_response) { { '/about' => 1, '/contact' => 1 } }
  let(:sorter_double) { instance_double(sorter.to_s, call: sorter_response) }
  let(:reporter_double) { instance_double(reporter.to_s, call: true) }

  describe '#call' do
    before do
      allow(Strategies::SortUniq).to receive(:new).with(records).and_return(sorter_double)
      allow(Reporters::MostViewed).to receive(:new).with(sorter_response).and_return(reporter_double)
    end

    it 'calls sorter class' do
      service.call
      expect(sorter_double).to have_received(:call)
    end

    it 'calls reporter class' do
      service.call
      expect(reporter_double).to have_received(:call)
    end
  end
end
