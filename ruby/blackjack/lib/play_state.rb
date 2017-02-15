# frozen_string_literal: true

module PlayState
  # Player/Dealer
  DEFAULT_STATE = :unknown
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
    @turn = CONTINUE
    @state = DEFAULT_STATE
  end

  # Turn
  def done!
    @turn = DONE
  end

  def done?
    @turn.equal?(DONE)
  end

  def continue?
    @turn.equal?(CONTINUE)
  end

  # Decisons
  def hit!
    @action = :hit
  end

  def stand!
    done!
    @action = :stand
  end

  # Player/Dealer
  def unknown?
    @state.equal?(DEFAULT_STATES)
  end

  def blackjack!
    done!
    @state = BLACKJACK
  end

  def twenty_one!
    done!
    @state = TWENTY_ONE
  end

  def high_hand!
    @state = HIGH_HAND
  end

  def low_hand!
    @state = LOW_HAND
  end

  def dealer_blackjack!
    done!
    @state = DEALER_BLACKJACK
  end

  def dealer_bust!
    done!
    @state = DEALER_BUST
  end

  def bust!
    done!
    @state = BUST
  end

  def push!
    @state = PUSH
  end

  # Final States
  def won?
    WIN_STATES.include?(@state)
  end

  def lost?
    LOSS_STATES.include?(@state)
  end

  def tie?
    TIE_STATES.include?(@state)
  end
end
