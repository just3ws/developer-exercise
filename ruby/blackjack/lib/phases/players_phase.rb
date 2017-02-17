# frozen_string_literal: true

module Phases
  class PlayersPhase
    include States::DecisionState

    attr_accessor :game

    def initialize(game:)
      @game = game
    end

    def run
      deal_an_upcard_to_each_player
      deal_an_upcard_to_the_dealer
      deal_an_upcard_to_each_player

      Blackjack.logger.info("Dealer upcard is #{game.dealer.upcard.for_humans}")

      game.boxes.each_with_index do |player, i|
        i += 1
        Blackjack.logger.info { "Beginning turn for #{player.name}" }

        22.times do |turn_guard|
          raise 'INCONCEIVABLE!' if turn_guard >= 21

          Blackjack.logger.info { "#{player.name} holding #{player.hand.description}" }

          decision = player.decide

          case decision
          when STAND
            Blackjack.logger.info("#{player.name} has decided to STAND")
          when HIT
            Blackjack.logger.info("#{player.name} has decided to HIT")
            deal_upcard_to(player)
          end

          if player.hand.bust?
            player.bust!
          elsif player.hand.blackjack?
            player.blackjack!
          elsif player.hand.twenty_one?
            player.twenty_one!
          end

          Blackjack.logger.info { "#{player.name} play state is #{player.play_state}" }

          next unless player.done?

          Blackjack.logger.debug { "#{player.name} has hand: #{player.hand.description}" }

          Blackjack.logger.info { "#{player.name} turn is #{player.turn_state}" }

          break
        end

        Blackjack.logger.info("End of turn for #{player.name}")
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
