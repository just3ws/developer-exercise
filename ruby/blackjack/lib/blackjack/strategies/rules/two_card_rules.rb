# frozen_string_literal: true

module Blackjack
  module Strategies
    module Rules
      class TwoCardRules
        attr_reader :hand_tokens, :upcard_token

        def initialize(params = {})
          @upcard_token = params[:upcard_token]
          @hand_tokens = params[:hand_tokens]
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
          return true if %w(2,2 3,3 4,4 5,5 2,A 3,A 4,A 5,A 6,A).include?(hand_tokens)

          return true if %w(6,6 7,7).include?(hand_tokens) && %w(8 9 10 A).include?(upcard_token)

          '7,A' == hand_tokens && %w(9 10 A).include?(upcard_token)
        end

        def stand?
          return true if %w(8,8 9,9 10,10 8,A 9,A A,A).include?(hand_tokens)

          return true if '6,6' == hand_tokens && %w(2 3 4 5 6).include?(upcard_token)

          return true if '7,7' == hand_tokens && %w(2 3 4 5 6 7).include?(upcard_token)

          '7,A' == hand_tokens && %w(2 3 4 5 6 7 8).include?(upcard_token)
        end
      end
    end
  end
end
