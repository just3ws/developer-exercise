# encoding: utf-8
# frozen_string_literal: true

require_relative 'rules/two_card_rules'
require_relative 'rules/point_total_rules'
require_relative 'rules/three_plus_soft_hand_rules'
require_relative 'rules/soft_17_rules'

module Blackjack
  module Strategies
    module BasicStrategy
      def decision_parameters
        {
          hand_type: hand.soft? ? :soft : :hard,
          point_total: hand.point_total,
          upcard_token: @game.dealer.upcard.as_token,
          hand_tokens: hand.cards.map(&:as_token).sort.join(',')
        }
      end

      def decision_engines
        [].tap do |engines|
          engines << Rules::TwoCardRules.new(decision_parameters)
          engines << Rules::PointTotalRules.new(decision_parameters)
          engines << Rules::Soft17Rules.new(decision_parameters)
          engines << Rules::ThreePlusSoftHand.new(decision_parameters)
        end
      end

      def decide!
        suggestions = decision_engines.map(&:suggest)
        count = suggestions.count

        hit_count = suggestions.count { |suggestion| suggestion == :hit }
        stand_count = suggestions.count { |suggestion| suggestion == :stand }
        indeterminate_count = suggestions.count { |suggestion| suggestion == :indeterminate }

        return :hit if hit_count > (stand_count + indeterminate_count)
        return :stand if stand_count > (hit_count + indeterminate_count)

        puts

        raise "I Dunno LOL ¯\(°_o)/¯"
      end

      def hit?
        return Rules::TwoCardRules.new(decision_parameters).hit? if hand.pair?
        return Rules::PointTotalRules.new(decision_parameters).hit? if hand.hard?

        puts

        raise "I Dunno LOL ¯\(°_o)/¯"
      end

      def stand?
        return Rules::TwoCardRules.new(decision_parameters).stand? if hand.pair?
        return Rules::PointTotalRules.new(decision_parameters).stand? if hand.hard?

        puts

        raise "I Dunno LOL ¯\(°_o)/¯"
      end
    end
  end
end
