# frozen_string_literal: true

require 'reporters/base'
require 'reporters/uniq_views'
require 'support/shared_examples/report_valid_content'

RSpec.describe Reporters::UniqViews do
  subject(:reporter) { described_class.new(records) }

  let(:records) { { '/about' => 2, '/contact/3' => 3 } }
  let(:target) { $stdout }

  describe '#call' do
    before do
      allow(target).to receive(:puts)
      reporter.call
    end

    it_behaves_like 'report valid content' do
      let(:header) { '=================Uniq page views=================' }
      let(:footer) { '==============END Uniq page views================' }
      let(:first_line) { '/about 2 uniq views' }
      let(:second_line) { '/contact/3 3 uniq views' }
    end
  end
end
