# frozen_string_literal: true

module Strategies
  module HitOnSoft17Strategy
    def decide
      if hand.soft? && hand.point_total < 17 then hit!
      elsif hand.point_total <= 11 then hit!
      else stand!
      end.tap { |decision| remember(decision) }
    end
  end
end
