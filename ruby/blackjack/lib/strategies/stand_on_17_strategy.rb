# frozen_string_literal: true

module Strategies
  module StandOn17Strategy
    def decide
      if hand.point_total < 17 then hit!
      else stand!
      end.tap { |decision| remember(decision) }
    end
  end
end
