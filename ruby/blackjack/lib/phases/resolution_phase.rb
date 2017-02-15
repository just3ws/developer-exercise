# frozen_string_literal: true

module Phases
  class ResolutionPhase
    attr_accessor :game

    def initialize(game:)
      @game = game
      @board = {
        dealer: @game.dealer,
        won: [],
        lost: [],
        unknown: [],
        tied: []
      }
    end

    def run

      if game.dealer.hand.bust?
        LOG.debug("Dealer busted holding #{game.dealer.hand.description}")
        # If player hasn't already won then convert to win by dealer bust
        game.boxes.select { |player| player.unknown? }.each(&:dealer_bust!)
      elsif game.dealer.hand.blackjack?
        LOG.debug("Dealer blackjack holding #{game.dealer.hand.description}")
        # NOTE: "Blackjack" is an exactly 2 card twenty-one and beats a >2 twenty-one.

        # If player hasn't already won then convert to loss by dealer blackjack
        game.boxes.reject { |player| player.hand.blackjack? }.each(&:dealer_blackjack!)
        # If player has blackjack as well then they are converted to push
        game.boxes.select { |player| player.hand.blackjack? }.each(&:push!)
      else
        LOG.debug("Dealer showdown holding #{game.dealer.hand.description}")

        # Dealer showdown
        remaining_players = game.boxes.reject do |player|
          player.lost? || player.hand.blackjack?
        end

        remaining_players.each do |player|
          if player.hand.point_total > game.dealer.hand.point_total
            player.high_hand!
          elsif player.hand.point_total == game.dealer.hand.point_total
            player.push!
          else
            player.low_hand!
          end
        end
      end

      game.boxes.each_with_index do |player, i|
        i = i+1

        final = if player.won?
                  'won'
                elsif player.lost?
                  'lost'
                elsif player.tied?
                  'tied'
                else
                  raise 'Unknown final play state'
                end
        LOG.debug("Player #{i} #{final} by #{player.play_state} with #{player.hand.description}")

      end
    end
  end
end
