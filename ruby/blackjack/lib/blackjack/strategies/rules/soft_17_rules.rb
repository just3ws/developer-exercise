# frozen_string_literal: true

module Blackjack
  module Strategies
    module Rules
      class Soft17Rules
        attr_reader :point_total, :hand_type

        def initialize(params = {})
          @hand_type = params[:hand_type]
          @point_total = params[:point_total]
        end
        #
        # soft 17? hit
        #
        # else stand
        #

        def suggest
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
