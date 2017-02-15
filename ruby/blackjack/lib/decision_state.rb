# frozen_string_literal: true

module DecisionState
  attr_accessor :decisions

  UNKNOWN_DECISION_STATE = :unknown
  HIT = :hit
  STAND = :stand

  def set_initial_decisions_state!
    @decision_state = UNKNOWN_DECISION_STATE
    @decisions = []
  end

  # Decisons
  def hit!
    @decision_state = HIT
  end

  def stand!
    done!

    @decision_state = STAND
  end
end
