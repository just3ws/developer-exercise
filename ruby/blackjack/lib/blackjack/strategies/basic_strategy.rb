# encoding: utf-8
# frozen_string_literal: true

module Blackjack
  module Strategies
    module BasicStrategy
      def params
        {
          point_total: hand.point_total.to_s,
          upcard_token: @game.dealer.upcard.as_token,
          hand_tokens: hand.cards.map(&:as_token).sort.join(',')
        }
      end

      def hit?
        return TwoCardRules.new(params).hit? if hand.pair?
        return PointTotalRules.new(params).hit? if hand.hard?

        puts

        raise "I Dunno LOL ¯\(°_o)/¯"
      end

      def stand?
        return TwoCardRules.new(params).stand? if hand.pair?
        return PointTotalRules.new(params).stand? if hand.hard?

        puts

        raise "I Dunno LOL ¯\(°_o)/¯"
      end
    end

    class TwoCardRules
      attr_reader :hand_tokens, :upcard_token

      def initialize(params = {})
        @upcard_token = params[:upcard_token]
        @hand_tokens = params[:hand_tokens]
      end

      def hit?
        return true if %w(2,2 3,3 4,4 5,5 2,A 3,A 4,A 5,A 6,A).include?(hand_tokens)

        return true if %w(6,6 7,7).include?(hand_tokens) && %w(8 9 10 A).include?(dealer_token)

        '7,A' == hand_tokens && %w(9 10 A).include?(dealer_token)
      end

      def stand?
        return true if %w(8,8 9,9 10,10 8,A 9,A A,A).include?(hand_tokens)

        return true if '6,6' == hand_tokens && %w(2 3 4 5 6).include?(dealer_token)

        return true if '7,7' == hand_tokens && %w(2 3 4 5 6 7).include?(dealer_token)

        '7,A' == hand_tokens && %w(2 3 4 5 6 7 8).include?(dealer_token)
      end
    end

    class PointTotalRules
      attr_reader :point_total, :upcard_token
      def initialize(params = {})
        @upcard_token = params[:upcard_token]
        @point_total  = params[:point_total]
      end

      def hit?
        return true if %w(5 6 7 8 9 10 11).include?(point_total)
        return true if %w(12).include?(point_total) && %w(2 3).include?(upcard_token)
        return true if %w(12).include?(point_total) && %w(7 8 9 10 A).include?(upcard_token)
        %w(13 14 15 16).include?(point_total) && %w(7 8 9 10 A).include?(upcard_token)
      end

      def stand?
        return true if %w(17 18 19 20).include?(point_total)
        return true if %w(12).include?(point_total) && %w(4 5 6).include?(upcard_token)
        %w(13 14 15 16).include?(point_total) && %w(2 3 4 5 6).include?(upcard_token)
      end
    end
  end
end
