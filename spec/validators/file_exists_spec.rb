# frozen_string_literal: true

require 'validators/base'
require 'validators/file_exists'
require 'entities/base'
require 'entities/file'

RSpec.describe Validators::FileExists do
  subject(:validator) { described_class.new(file) }

  let(:path) { File.join(File.dirname(__FILE__), '../fixtures/webserver.log') }
  let(:file) { instance_double('Entities::File', path: path) }

  describe '#valid?' do
    context 'when file exists' do
      it 'is valid' do
        expect(validator).to be_valid
      end

      it 'return empty errors' do
        expect(validator.errors).to eq([])
      end
    end

    context 'when file does not exists' do
      let(:path) { '/tmp/test.log' }
      let(:expected_errors) { ["#{path} is not a file"] }

      it 'is invalid' do
        expect(validator).not_to be_valid
      end

      it 'return array of errors' do
        validator.valid?
        expect(validator.errors).to eq(expected_errors)
      end
    end
  end
end
