# frozen_string_literal: true

module States
  module PlayState
    attr_accessor :play_state

    # Player/Dealer
    UNKNOWN_PLAY_STATE = :unknown
    BLACKJACK = :blackjack
    TWENTY_ONE = :twenty_one
    HIGH_HAND = :high_hand
    DEALER_BUST = :dealer_bust
    WIN_STATES = [BLACKJACK, TWENTY_ONE, HIGH_HAND, DEALER_BUST].freeze
    LOW_HAND = :low_hand
    BUST = :bust
    DEALER_BLACKJACK = :dealer_blackjack
    LOSS_STATES = [BUST, LOW_HAND, DEALER_BLACKJACK].freeze
    PUSH = :push
    TIE_STATES = [PUSH].freeze

    def set_initial_play_state!
      @play_state = UNKNOWN_PLAY_STATE
    end

    # Player/Dealer
    def unknown?
      @play_state.equal?(UNKNOWN_PLAY_STATE)
    end

    def blackjack!
      done!
      @play_state = BLACKJACK
    end

    def twenty_one!
      done!
      @play_state = TWENTY_ONE
    end

    def high_hand!
      @play_state = HIGH_HAND
    end

    def low_hand!
      @play_state = LOW_HAND
    end

    def dealer_blackjack!
      done!
      @play_state = DEALER_BLACKJACK
    end

    def dealer_bust!
      done!
      @play_state = DEALER_BUST
    end

    def bust!
      done!
      @play_state = BUST
    end

    def push!
      @play_state = PUSH
    end

    # Final States
    def won?
      WIN_STATES.include?(@play_state)
    end

    def lost?
      LOSS_STATES.include?(@play_state)
    end

    def tie?
      TIE_STATES.include?(@play_state)
    end
  end
end
