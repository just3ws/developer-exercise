# frozen_string_literal: true

module PlayState
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

  # Decisions
  HIT = :hit
  STAND = :stand

  # Turn
  CONTINUE = :continue
  DONE = :done

  # Defaults
  def defaults!
    @turn_state = CONTINUE
    @play_state = UNKNOWN_PLAY_STATE
  end

  # Turn
  def done!
    @turn_state = DONE
  end

  def done?
    @turn_state.equal?(DONE)
  end

  def continue?
    @turn_state.equal?(CONTINUE)
  end

  # Decisons
  def hit!
    @decision_state = :hit
  end

  def stand!
    done!
    @decision_state = :stand
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
