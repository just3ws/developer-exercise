# frozen_string_literal: true
require 'blackjack'

module Rules
  class Soft17Rules
    attr_accessor :facts

    def initialize(facts)
      @facts = facts
    end

    def suggest
      suggestion = if hit? then :hit if hit?
                   elsif stand? then :stand if stand?
                   else :indeterminate
                   end
      Blackjack.logger.debug(suggestion)
      suggestion
    end

    def hit?
      facts.hand_type == :soft && facts.point_total <= 17
    end

    def stand?
      facts.hand_type == :soft && facts.point_total > 17
    end
  end
end
