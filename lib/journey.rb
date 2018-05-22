class Journey
    PENALTY_FARE = 6
    MIN_FARE = 1
    attr_accessor :entry_station, :exit_station
    def initialize
        @entry_station = nil
        @exit_station = nil
        @finished = false
    end

    def finished?
        @finished
    end

    def start(entry_station)
        @entry_station = entry_station
    end

    def finish(exit_station)
        @exit_station = exit_station
        @finished = true
    end

    def fare
      (!entry_station || !exit_station) ? PENALTY_FARE : MIN_FARE
    end
end