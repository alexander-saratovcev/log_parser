# frozen_string_literal: true

require 'validators/base'
require 'validators/file_extension'
require 'entities/base'
require 'entities/file'

RSpec.describe Validators::FileExtension do
  subject(:validator) { described_class.new(file) }

  let(:file_extension) { 'log' }
  let(:path) { File.join(File.dirname(__FILE__), "../fixtures/webserver.#{file_extension}") }
  let(:file) { instance_double('Entities::File.new', path: path, extension: file_extension) }

  describe '#valid?' do
    context 'when valid file extension' do
      let(:file_extension) { 'log' }

      it 'is valid' do
        expect(validator).to be_valid
      end

      it 'return empty errors' do
        expect(validator.errors).to eq([])
      end
    end

    context 'when not allowed file extension' do
      let(:file_extension) { 'html' }
      let(:expected_errors) { ['extension should be one of [log txt]'] }

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
