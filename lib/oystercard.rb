class Oystercard
    DEFAULT_BALANCE = 0
    MAX_BALANCE_ALLOWED_ON_CARD = 90
    attr_reader :balance

    def initialize
        @balance = DEFAULT_BALANCE
    end
    
    def top_up(amount)
        fail "You can't top up more than £90" if (@balance + amount) > MAX_BALANCE_ALLOWED_ON_CARD
        @balance += amount
    end
end