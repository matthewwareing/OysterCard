require 'station'

describe Station do
    subject(:station) { described_class.new(station_name, station_zone) }
    let(:station_name) { double :station_name }
    let(:station_zone) { double :station_zone }

    describe '#name' do
        it 'returns the station name' do
            expect(station.name).to eq station_name
        end
        
        it 'returns the station zone' do
            expect(station.zone).to eq station_zone
        end
    end
end