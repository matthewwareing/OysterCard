class Oystercard
    DEFAULT_BALANCE = 0
    MAX_BALANCE = 90
    MIN_BALANCE_TO_TRAVEL = 1
    attr_reader :balance, :in_use
    attr_accessor :entry_station, :journeys
    def initialize
        @balance = DEFAULT_BALANCE
        @entry_station = nil
        @journeys = []
    end
    
    def top_up(amount)
        fail "You can't top up more than £#{MAX_BALANCE}" if balance + amount > MAX_BALANCE
        @balance += amount
    end

    private def deduct(amount)
        @balance -= amount
    end

    def in_journey?
        !!entry_station
    end

    def touch_in entry_station
        fail "You can't touch in before you've touched out!" if in_journey? == true
        fail "Sorry, you don't have enough funds to travel." if balance < MIN_BALANCE_TO_TRAVEL
        @entry_station = entry_station
        journeys << {entry_station: entry_station, exit_station: nil }
    end

    def touch_out exit_station
        fail "You can't touch out before you've touched in!" if in_journey? == false
        deduct(MIN_BALANCE_TO_TRAVEL)
        journeys.last[:exit_station] = exit_station
        @entry_station = nil
    end
end