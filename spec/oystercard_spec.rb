require 'oystercard'

describe Oystercard do
    subject(:oystercard) { described_class.new }
    it 'I want money on my card' do
        expect(oystercard.balance).to eq 0
    end

    it '#top_up' do
        expect { oystercard.top_up(10) }.to change { oystercard.balance }.by 10
    end
end