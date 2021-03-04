# frozen_string_literal: true

require 'interactors/generate_report'
require 'errors/validation_error'
require 'validators/base'
require 'validators/file_exists'
require 'validators/file_extension'
require 'services/print_report'
require 'services/collect_log_records'
require 'entities/base'
require 'entities/log_record'
require 'entities/file'
require 'reporters/base'
require 'reporters/most_viewed'
require 'reporters/uniq_views'
require 'strategies/sort_base'
require 'strategies/sort_uniq'
require 'strategies/sort_most_viewed'

RSpec.describe Interactors::GenerateReport do
  subject(:service) { described_class.new(file_path) }

  describe '#call' do
    context 'when valid file' do
      let(:file_path) { File.join(File.dirname(__FILE__), '../fixtures/webserver.log') }
      let(:valid_output) { File.read(File.join(File.dirname(__FILE__), '../fixtures/valid_output.txt')).split("\n") }

      it 'does not raise error' do
        allow($stdout).to receive(:puts).and_return(nil)
        expect { service.call }.not_to raise_error
      end

      it 'has valid output' do
        allow($stdout).to receive(:puts)
        service.call
        valid_output.each { |line| expect($stdout).to have_received(:puts).with(line) }
      end
    end

    context 'when invalid file' do
      context 'when invalid file extension' do
        let(:file_path) { File.join(File.dirname(__FILE__), '../fixtures/invalid_file.pdf') }

        it 'raise error' do
          expect do
            service.call
          end.to raise_error(Errors::ValidationError, 'Errors: ["extension should be one of [log txt]"]')
        end
      end

      context 'when file does not exists' do
        let(:file_path) { '/tmp/file.log' }

        it 'raise error' do
          expect { service.call }.to raise_error(Errors::ValidationError, 'Errors: ["/tmp/file.log is not a file"]')
        end
      end
    end
  end
end
