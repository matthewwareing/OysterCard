require 'oystercard'

describe Oystercard do
    subject(:oystercard) { described_class.new }
    it 'I want money on my card' do
        expect(subject.balance).to eq 0
    end
end