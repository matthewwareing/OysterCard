class Oystercard
    DEFAULT_BALANCE = 0
    MAX_BALANCE = 90
    MIN_BALANCE_TO_TRAVEL = 1
    attr_reader :balance
    attr_accessor :journeys, :my_journey
    def initialize(my_journey: Journey.new)
        @balance = DEFAULT_BALANCE
        @journeys = []
        @my_journey = my_journey
    end
    
    def top_up(amount)
        fail "You can't top up more than £#{MAX_BALANCE}" if balance + amount > MAX_BALANCE
        @balance += amount
    end

    private def deduct(amount)
        @balance -= amount
    end

    def touch_in entry_station
        fail "Sorry, you don't have enough funds to travel." if balance < MIN_BALANCE_TO_TRAVEL
        my_journey.start(entry_station)
        
    end

    def touch_out exit_station
        deduct(MIN_BALANCE_TO_TRAVEL)
        my_journey.finish(exit_station)
        journeys << my_journey
        @my_journey = Journey.new
    end
end