# frozen_string_literal: true
require_relative '../blackjack'

module Rules
  class Soft17Rules
    attr_accessor :facts

    def initialize(facts)
      @facts = facts
    end

    def suggest
      print "CHECKING #{self.class.name.split('::').last} => "
      suggestion = if hit? then :hit if hit?
                   elsif stand? then :stand if stand?
                   else :indeterminate
                   end
      puts suggestion
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