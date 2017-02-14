# encoding: utf-8
# frozen_string_literal: true

require 'ostruct'

require_relative 'rules/two_card_rules'
require_relative 'rules/point_total_rules'
require_relative 'rules/three_plus_soft_hand_rules'
require_relative 'rules/soft_17_rules'

module Blackjack
  module Strategies
    module BasicStrategy
      # def facts
      #   OpenStruct.new(
      #     hand_type: hand.soft? ? :soft : :hard,
      #     point_total: hand.point_total,
      #     upcard_token: @game.dealer.upcard.as_token,
      #     hand_tokens: hand.cards.map(&:as_token).sort.join(',')
      #   ).freeze
      # end

      def decision_engines
        [].tap do |engines|
          # engines << Rules::PointTotalRules.new(facts)
          # engines << Rules::ThreePlusSoftHandRules.new(facts)
          # engines << Rules::TwoCardRules.new(facts)
          engines << Rules::Soft17Rules.new(facts)
        end
      end

      def decide!
        ap facts

        @decision = begin
                      suggestions = decision_engines.map(&:suggest)
                      count = suggestions.count

                      puts

                      hit_count = suggestions.count { |suggestion| suggestion == :hit }
                      stand_count = suggestions.count { |suggestion| suggestion == :stand }
                      indeterminate_count = suggestions.count { |suggestion| suggestion == :indeterminate }

                      ap [
                        suggestions,
                        count,
                        hit_count,
                        stand_count,
                        indeterminate_count
                      ]

                      if hit_count > (stand_count + indeterminate_count)
                        :hit
                      elsif stand_count > (hit_count + indeterminate_count)
                        :stand
                      else
                        :indeterminate
                      end
                    end
      end

      def hit?
        # return Rules::TwoCardRules.new(facts).hit? if hand.pair?
        # return Rules::PointTotalRules.new(facts).hit? if hand.hard?

        # puts

        # raise "I Dunno LOL ¯\(°_o)/¯"
      end

      def stand?
        return Rules::TwoCardRules.new(facts).stand? if hand.pair?
        return Rules::PointTotalRules.new(facts).stand? if hand.hard?

        puts

        raise "I Dunno LOL ¯\(°_o)/¯"
      end
    end
  end
end
