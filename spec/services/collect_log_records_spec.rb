# frozen_string_literal: true

require 'services/collect_log_records'
require 'entities/base'
require 'entities/log_record'
require 'entities/file'

RSpec.describe Services::CollectLogRecords do
  subject(:collector) { described_class.new(file) }

  let(:path) { File.join(File.dirname(__FILE__), '../fixtures/webserver.log') }
  let(:file) { instance_double('Entities::File.new', path: path, extension: 'log', file_name: 'webserver') }

  describe '#call' do
    it 'return an array of records' do
      expect(collector.call).to all(be_an(Entities::LogRecord))
    end

    it 'return valid count of records' do
      expect(collector.call.count).to eq(8)
    end
  end
end
