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