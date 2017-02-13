# encoding: utf-8
# frozen_string_literal: true

module Blackjack
  module Strategies
    module Rules
      class ThreePlusSoftHandRules
        # Play #7. Playing a Soft Hand Containing Three or More Cards
        #
        # “My strategy card says to double soft 18 against a 4, but if I’m dealt Ace-3-4
        # and I can’t double down, I’m not sure if I should stand or hit?” When your soft
        # hand contains three or more cards, the casino rules will not allow you to
        # double down. So what should you do? Just follow these two simple rules to play
        # these hands perfectly every time.
        #
        # 1. If you have soft 17 or less, always hit (i.e., never, never stand with soft
        # 17 or less regardless of what the dealer shows).
        #
        # 2. If you have soft 18 - 21, always stand, except hit a multi-card soft 18
        # against a dealer 9, 10, or ace.

        def suggestion
          return :hit if hit?
          return :stand if stand?
          :indeterminate
        end

        def hit?; end

        def stand?; end
      end
    end
  end
end
