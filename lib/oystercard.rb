class Oystercard
    DEFAULT_BALANCE = 0
    MAX_BALANCE = 90
    MIN_BALANCE_TO_TRAVEL = 1
    attr_reader :balance, :in_use
    attr_accessor :entry_station
    def initialize
        @balance = DEFAULT_BALANCE
        @in_use = false
        @entry_station = nil
    end
    
    def top_up(amount)
        fail "You can't top up more than £#{MAX_BALANCE}" if balance + amount > MAX_BALANCE
        @balance += amount
    end

    private def deduct(amount)
        @balance -= amount
    end

    def in_journey?
        entry_station != nil
    end

    def touch_in entry_station
        fail "You can't touch in before you've touched out!" if in_journey? == true
        fail "Sorry, you don't have enough funds to travel." if balance < MIN_BALANCE_TO_TRAVEL
        @entry_station = entry_station
        @in_use = true
    end

    def touch_out
        fail "You can't touch out before you've touched in!" if in_journey? == false
        @in_use = false
        deduct(MIN_BALANCE_TO_TRAVEL)
        @entry_station = nil
    end

    # private 
end