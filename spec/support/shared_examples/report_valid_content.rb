# frozen_string_literal: true

RSpec.shared_examples 'report valid content' do
  it 'send valid header' do
    expect(target).to have_received(:puts).with(header)
  end

  it 'send valid footer' do
    expect(target).to have_received(:puts).with(footer)
  end

  it 'send valid content' do
    [first_line, second_line].each { |line| expect(target).to have_received(:puts).with(line) }
  end
end
