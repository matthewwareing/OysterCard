require 'oystercard'

describe Oystercard do
    subject(:oystercard) { described_class.new }
    it 'I want money on my card' do
        expect(oystercard.balance).to eq 0
    end

    it '#top_up' do
        expect { oystercard.top_up(10) }.to change { oystercard.balance }.by 10
    end

    it '#top_up max balance' do
        expect{ oystercard.top_up(91) }.to raise_error "You can't top up more than £90"
    end
end