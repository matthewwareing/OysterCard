require 'oystercard'

describe Oystercard do
    subject(:oystercard) { described_class.new }

    describe '#balance' do
        it 'default value is zero' do
            expect(oystercard.balance).to eq 0
        end
    end

    describe '#top_up' do
        it 'allows topping up' do
            expect { oystercard.top_up(1) }.to change { oystercard.balance }.by 1
        end
    
        it 'raises error when max balance is exceeded' do
            max_balance = Oystercard::MAX_BALANCE
            oystercard.top_up(max_balance)
            expect{ oystercard.top_up(1) }.to raise_error "You can't top up more than £#{max_balance}"
        end
    end

    describe '#deduct' do
        it 'allows deducting balance' do
            oystercard.top_up(2)
            expect { oystercard.deduct(1)}.to change { oystercard.balance }.by -1 
        end
    end

    describe 'Journeys' do

        context 'has not started' do
            it '#in_journey?' do
                expect(oystercard.in_journey?).to eq false
            end

            it '#touch_in' do
                oystercard.top_up(1)
                oystercard.touch_in
                expect(oystercard.in_use).to eq true
            end
            
            it 'touch_in rejected when have less than minimum amount required' do
                min_balance = Oystercard::MIN_BALANCE_TO_TRAVEL
                expect { oystercard.touch_in }.to raise_error "Sorry, you don't have enough funds to travel."
            end

            it '#touch_out' do
                expect {oystercard.touch_out }.to raise_error "You can't touch out before you've touched in!"
            end
        end

        context 'Journey has started' do
            before { allow(oystercard).to receive(:in_journey?).and_return(true) }

            it '#in_journey?' do
                expect(oystercard.in_journey?).to eq true
            end

            it '#touch_in' do
                expect { oystercard.touch_in }.to raise_error "You can't touch in before you've touched out!"
            end

            it '#touch_out' do
                oystercard.touch_out
                expect(oystercard.in_use).to eq false
            end
        end
    end
end