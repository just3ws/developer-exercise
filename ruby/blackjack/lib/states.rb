# frozen_string_literal: true
module States
  HIGH_HAND_STATE = :high_hand
  TWENTY_ONE_STATE = :twenty_one
  BLACKJACK_STATE = :blackjack
  WIN_STATES = [BLACKJACK_STATE, TWENTY_ONE_STATE, HIGH_HAND_STATE].freeze

  LOW_HAND_STATE = :low_hand
  BUST_STATE = :bust
  LOSS_STATES = [BUST_STATE, LOW_HAND_STATE].freeze

  PUSH_STATE = :push
  DRAW_STATES = [PUSH_STATE].freeze

  DEFAULT_STATE = :default

  def high_hand!
    @state = HIGH_HAND_STATE
  end

  def blackjack!
    @state = BLACKJACK_STATE
  end

  def twenty_one!
    @state = TWENTY_ONE_STATE
  end

  def bust!
    @state = BUST_STATE
  end

  def low_hand!
    @state = LOW_HAND_STATE
  end

  def push!
    @state = PUSH_STATE
  end

  def default_state!
    @state = DEFAULT_STATE
  end
end
