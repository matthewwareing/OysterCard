require 'journey'

describe Journey do
    subject(:journey) { described_class.new }
    let(:entry_station) { double :entry_station }
    let(:exit_station) { double :exit_station }

    it '#in_journey?' do
        expect(journey.in_journey?).to eq false
    end

    it '#start' do
        journey.start(entry_station)
        expect(journey.entry_station).to eq entry_station
    end

    it '#finish' do
        journey.finish(exit_station)
        expect(journey.exit_station).to eq exit_station
    end
end


# it 'touch out reduces balance by minimum fare' do
#     min_fare = Oystercard::MIN_BALANCE_TO_TRAVEL
#     expect { oystercard.touch_out(exit_station) }.to change{ oystercard.balance }.by(-min_fare)
# end

# it '#touch_out returns entry_station to nil' do
#     oystercard.touch_out(exit_station)
#     expect(journey.entry_station).to eq nil
# end