# frozen_string_literal: true

# require_relative '../../../log'
require_relative 'phases/players_phase'

module Blackjack
  class Session
    def initialize(game:)
      @game = game
    end

    def run
      Phases::PlayersPhase.new(game: game).go
    end

    #    def dealer
    #      raise NotImplementedError
    #
    #      game.dealer.hole_card.upcard!
    #
    #      22.times do |i|
    #        raise 'INCONCEIVABLE!' if i >= 21
    #
    #        break if game.dealer.stand?
    #
    #        game.dealer.deal_upcard_to(game.dealer) if game.dealer.hit?
    #
    #        if game.dealer.blackjack?
    #          game.dealer.blackjack!
    #          break
    #        end
    #
    #        if game.dealer.bust?
    #          game.dealer.bust!
    #          break
    #        end
    #      end
    #    end

    #    def showdown
    #      game.boxes.each do |player|
    #        if game.dealer.bust?
    #          player.win!
    #        elsif game.dealer.point_total < player.point_total
    #          player.win!
    #        elsif game.dealer.blackjack? && player.blackjack?
    #          player.push!
    #        elsif game.dealer.point_total == player.point_total
    #          player.push!
    #        elsif game.dealer.point_total > player.point_total
    #          player.lose!
    #        elsif player.bust?
    #          player.lose!
    #        end
    #      end
    #    end

    private

    attr_reader :game
  end
end
