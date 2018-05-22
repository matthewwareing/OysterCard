class Journey
    attr_accessor :entry_station, :exit_station
    def initialize
        @entry_station = nil
        @exit_station = nil
    end

    def in_journey?
        !!entry_station
    end

    def start(entry_station)
        @entry_station = entry_station
    end

    def finish(exit_station)
        @exit_station = exit_station
    end

end