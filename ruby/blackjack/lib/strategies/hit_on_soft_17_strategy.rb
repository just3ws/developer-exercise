# frozen_string_literal: true
module Strategies
  module HitOnSoft17Strategy
    def decide
      decision = if hand.soft? && hand.point_total < 17
                   # Hit on Soft 17
                   hit!
                 elsif hand.point_total <= 11
                   # Hit on 11
                   hit!
                 else
                   stand!
                 end

      decisions.push({
        decision: decision, done?: done?
      }.merge(hand.as_graph))

      decision
    end
  end
end
