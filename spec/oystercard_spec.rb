require 'oystercard'

describe Oystercard do
    subject(:oystercard) { described_class.new }
    let(:entry_station) { double :entry_station }
    
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

    describe 'Journeys' do
    
        context 'has not started' do

            it '#in_journey?' do
                expect(oystercard.in_journey?).to eq false
            end

            it 'touch_in rejected when have less than minimum amount required' do
                expect { oystercard.touch_in(entry_station) }.to raise_error "Sorry, you don't have enough funds to travel."
            end

            it '#touch_out' do
                expect {oystercard.touch_out }.to raise_error "You can't touch out before you've touched in!"
            end
        end

        context 'Journey has started' do

            before do
                oystercard.top_up(10)
                oystercard.touch_in(entry_station)
            end

            it '#in_journey?' do
                expect(oystercard.in_journey?).to eq true
            end

            it '#touch_in' do
                expect(oystercard.in_journey?).to eq true
            end

            it 'touched_in remembers the station' do
                expect(oystercard.entry_station).to eq entry_station
            end

            it '#touch_in' do
                expect { oystercard.touch_in(entry_station) }.to raise_error "You can't touch in before you've touched out!"
            end

            it '#touch_out' do
                oystercard.touch_out
                expect(oystercard.in_journey?).to eq false
            end

            it 'touch out reduces balance by minimum fare' do
                min_fare = Oystercard::MIN_BALANCE_TO_TRAVEL
                expect { oystercard.touch_out }.to change{ oystercard.balance }.by(-min_fare)
            end

            it '#touch_out returns entry_station to nil' do
                oystercard.touch_out
                expect(oystercard.entry_station).to eq nil
            end
        end
    end
end