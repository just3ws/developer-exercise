# frozen_string_literal: true

module Strategies
  module StandOn17Strategy
    def decide
      decision = if hand.point_total < 17
                   # Stand on 17
                   hit!
                 else
                   stand!
                 end

      decisions.push({ decision: decision, done?: done? }.merge(hand.as_graph))

      decision
    end
  end
end
