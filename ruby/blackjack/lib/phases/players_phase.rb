# frozen_string_literal: true

module Phases
  class PlayersPhase
    include PlayState

    attr_accessor :game

    def initialize(game:)
      @game = game
    end

    def run
      deal_an_upcard_to_each_player
      deal_an_upcard_to_the_dealer
      deal_an_upcard_to_each_player

      LOG.info("Dealer upcard is #{game.dealer.upcard.for_humans}")

      game.boxes.each_with_index do |player, i|
        i += 1
        LOG.info("Beginning turn for Player #{i}")

        22.times do |turn_guard|
          raise 'INCONCEIVABLE!' if turn_guard >= 21

          LOG.info("Player #{i} holding #{player.hand.description}")

          decision = player.decide

          case decision
          when STAND
            LOG.info("Player #{i} has decided to #{'STAND'.colorize(color: :blue)}")
          when HIT
            LOG.info("Player #{i} has decided to #{'HIT'.colorize(color: :red)}")
            deal_upcard_to(player)
          end

          if player.hand.bust?
            player.bust!
          elsif player.hand.blackjack?
            player.blackjack!
          elsif player.hand.twenty_one?
            player.twenty_one!
          end

          if player.hand.bust?
            LOG.info("Dealer has #{player.state} by going bust")
          elsif player.hand.blackjack?
            LOG.info("Dealer has #{player.state} with blackjack")
          elsif player.hand.twenty_one?
            LOG.info("Dealer has #{player.state} with twenty_one")
          elsif player.hand.twenty_one?
            LOG.info("Dealer has #{player.state} by hitting #{player.hand.point_total}")
          else
            LOG.info("Dealer has #{player.hand.point_total} in hand so their win/lose/draw is #{player.state}")
          end

          next unless player.done?

          LOG.info("Player #{i} is done with their turn holding #{player.hand.description}")

          break
        end

        LOG.graph_for(player)

        LOG.info("End of turn for Player #{i}")
      end
    end

    def deal_an_upcard_to_each_player
      game.boxes.each do |player|
        deal_upcard_to(player)
      end
    end

    def deal_upcard_to(player)
      game.dealer.deal_upcard_to(player)
    end

    def deal_an_upcard_to_the_dealer
      game.dealer.deal_upcard_to(game.dealer)
    end
  end
end
