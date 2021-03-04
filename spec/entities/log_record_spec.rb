# frozen_string_literal: true

require 'entities/log_record'

RSpec.describe Entities::LogRecord do
  subject(:log_record) { described_class.new(params) }

  let(:path) { '/about/' }
  let(:ip) { '217.184.52.63' }
  let(:params) { { path: path, ip: ip } }

  describe '#path' do
    it 'return correct path' do
      expect(log_record.path).to eq(path)
    end
  end

  describe '#ip' do
    it 'return correct ip' do
      expect(log_record.ip).to eq(ip)
    end
  end

  describe '#to_a' do
    it 'return array' do
      expect(log_record.to_a).to eq([path, ip])
    end
  end
end
