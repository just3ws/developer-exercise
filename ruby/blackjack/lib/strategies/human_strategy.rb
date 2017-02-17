# frozen_string_literal: true

require_relative '../states/decision_state'

module Strategies
  module HumanStrategy
    include States::DecisionState

    def decide
      case Questions::HitOrStandQuestion.ask.then_wait_for.answer
      when HIT then hit!
      when hand.point_total == 21 then stand!
      when STAND then stand!
      end.tap { |decision| remember(decision) }
    end
  end
end
