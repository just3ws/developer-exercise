# frozen_string_literal: true

module Blackjack
  module Strategies
    module Rules
      class PointTotalRules
        attr_reader :point_total, :upcard_token

        def initialize(params = {})
          @upcard_token = params[:upcard_token]
          @point_total  = params[:point_total]
        end

        def suggest
          return :hit if hit?
          return :stand if stand?
          :indeterminate
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
end
