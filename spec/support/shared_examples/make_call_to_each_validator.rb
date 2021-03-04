# frozen_string_literal: true

RSpec.shared_examples 'makes a call to each validator' do
  it 'make call to each validator' do
    object.valid?
    expect(validators_instances).to all have_received(:valid?)
  end
end
