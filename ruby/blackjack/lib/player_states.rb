# frozen_string_literal: true
module PlayerStates
  include States

  DEALER_BLACKJACK_STATE = :dealer_blackjack
  LOSS_STATES << DEALER_BLACKJACK_STATE

  def dealer_blackjack!
    @state = DEALER_BLACKJACK_STATE
  end
end
