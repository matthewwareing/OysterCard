class Oystercard
    DEFAULT_BALANCE = 0
    MAX_BALANCE = 90
    attr_reader :balance, :in_use
    def initialize
        @balance = DEFAULT_BALANCE
        @in_use = false
    end
    
    def top_up(amount)
        fail "You can't top up more than £#{MAX_BALANCE}" if balance + amount > MAX_BALANCE
        @balance += amount
    end

    def deduct(amount)
        @balance -= amount
    end

    def in_journey?
        @in_use
    end

    def touch_in
        fail "You can't touch in before you've touched out!" if in_journey? == true
        @in_use = true
    end

    def touch_out
        fail "You can't touch out before you've touched in!" if in_journey? == false
        @in_use = false
    end
end