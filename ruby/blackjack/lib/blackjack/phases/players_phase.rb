# frozen_string_literal: true

module Blackjack
  module Phases
    class PlayersPhase
      attr_reader :dealer, :boxes

      def initialize(game:)
        @dealer = game.dealer
        @boxes = game.boxes
      end

      def go
        deal_an_upcard_to_each_player

        deal_an_upcard_to_the_dealer

        deal_an_upcard_to_each_player

        deal_a_downcard_to_the_dealer

        boxes.each do |player|
          22.times do |i|
            raise 'INCONCEIVABLE!' if i >= 21

            case player.decide
            when :stand then break
            when :hit then deal_upcard_to(player)
            end

            case player.tally
            when :blackjack
              player.win!
            when :bust
              player.lose!
            end

            break if player.done?
          end
        end

        def player_decision
          return :stand if player.stand?
          return :hit if player.hit?
          raise
        end

        def player_state
          return :blackjack if player.hand.blackjack?
          # player.hand.blackjack!
          # break
          # end

          return :bust if player.hand.bust?
          # player.hand.bust!
          # break
          # end

          :continue
        end

        def deal_an_upcard_to_each_player
          boxes.each do |player|
            deal_upcard_to(player)
          end
        end

        def deal_upcard_to(player)
          dealer.deal_upcard_to(player)
        end

        def deal_an_upcard_to_the_dealer
          dealer.deal_upcard_to(dealer)
        end

        def deal_a_downcard_to_the_dealer
          dealer.deal_downcard_to(dealer)
        end
      end
    end
  end
end
