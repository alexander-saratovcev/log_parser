# frozen_string_literal: true

require 'entities/base'
require 'entities/file'
require 'validators/base'
require 'validators/file_exists'
require 'validators/file_extension'
require 'support/shared_examples/make_call_to_each_validator'

RSpec.describe Entities::File do
  subject(:file) { described_class.new(path) }

  let(:directory) { '/tmp' }
  let(:file_name) { 'webserver' }
  let(:file_extension) { 'log' }
  let(:path) { "#{directory}/#{file_name}.#{file_extension}" }

  describe '#path' do
    it 'return correct path' do
      expect(file.path).to eq(path)
    end
  end

  describe '#extension' do
    it 'return correct extension' do
      expect(file.extension).to eq(file_extension)
    end
  end

  describe '#file_name' do
    it 'return correct file_name' do
      expect(file.file_name).to eq(file_name)
    end
  end

  describe '#valid?' do
    let(:validators) { [Validators::FileExists, Validators::FileExtension] }
    let(:errors) { [] }
    let(:first_validator) { instance_double('Validators::FileExists', valid?: validation_result, errors: errors) }
    let(:second_validator) { instance_double('Validators::FileExtension', valid?: validation_result, errors: errors) }

    before do
      allow(Validators::FileExists).to receive(:new).and_return(first_validator)
      allow(Validators::FileExtension).to receive(:new).and_return(second_validator)
      allow(first_validator).to receive(:valid?).and_return(validation_result)
      allow(second_validator).to receive(:valid?).and_return(validation_result)
    end

    context 'when all validations success' do
      let(:validation_result) { true }

      it 'returns true' do
        expect(file.valid?(validators)).to eq(true)
      end

      it 'has empty errors' do
        file.valid?(validators)
        expect(file.errors).to eq([])
      end

      it_behaves_like 'makes a call to each validator' do
        let(:validators_instances) { [first_validator, second_validator] }
        let(:object) { file }
      end
    end

    context 'when validation failed' do
      let(:validation_result) { false }
      let(:errors) { ['some errors'] }

      it 'returns false' do
        expect(file.valid?(validators)).to eq(false)
      end

      it 'not empty errors' do
        file.valid?(validators)
        expect(file.errors).not_to be_empty
      end

      it_behaves_like 'makes a call to each validator' do
        let(:validators_instances) { [first_validator, second_validator] }
        let(:object) { file }
      end
    end
  end
end
