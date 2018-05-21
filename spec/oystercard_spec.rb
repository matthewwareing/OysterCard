require 'oystercard'

describe Oystercard do
    subject(:oystercard) { described_class.new }
    it 'I want money on my card' do
        expect(oystercard.balance).to eq 0
    end

    it '#top_up' do
        expect { oystercard.top_up(10) }.to change { oystercard.balance }.by 10
    end

    it '#top_up raises error when max balance is exceeded' do
        max_balance = Oystercard::MAX_BALANCE
        oystercard.top_up(max_balance)
        expect{ oystercard.top_up(1) }.to raise_error "You can't top up more than £#{max_balance}"
    end

    it '#deduct' do
        expect { oystercard.deduct(10)}.to change { oystercard.balance }.by -10 
    end
end