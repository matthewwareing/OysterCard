require 'journey'

describe Journey do
    subject(:journey) { described_class.new }
    let(:entry_station) { double :entry_station }
    let(:exit_station) { double :exit_station }

    it "knows if a journey is not complete" do
        expect(journey).not_to be_finished
    end

    it 'has a default penalty fare' do
        expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    context '#start' do
        before { journey.start(entry_station) }

        it 'entry station' do
            expect(journey.entry_station).to eq entry_station
        end

        context '#finish' do
            before { journey.finish(exit_station) }
    
            it 'finishes fare' do
                expect(journey.exit_station).to eq exit_station
            end
    
            it 'has a minimum fare with a complete journey' do
                expect(journey.fare).to eq Journey::MIN_FARE
            end
        end
    end
end