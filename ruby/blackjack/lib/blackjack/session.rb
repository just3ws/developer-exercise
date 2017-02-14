# frozen_string_literal: true

# require_relative '../../../log'
require_relative 'phases/players_phase'

module Blackjack
  class Session
    def initialize(game:)
      @dealer = game.dealer
      @boxes = game.boxes
    end

    def run
      players_phase

      PlayersPhase.new(
        dealer: @dealer,
        boxes: @boxes
      ).go
    end

    def dealer
      raise NotImplementedError

      @dealer.hole_card.upcard!

      22.times do |i|
        raise 'INCONCEIVABLE!' if i >= 21

        break if @dealer.stand?

        @dealer.deal_upcard_to(@dealer) if @dealer.hit?

        if @dealer.blackjack?
          @dealer.blackjack!
          break
        end

        if @dealer.bust?
          @dealer.bust!
          break
        end
      end
    end

    def showdown
      @boxes.each do |player|
        if @dealer.bust?
          player.win!
        elsif @dealer.point_total < player.point_total
          player.win!
        elsif @dealer.blackjack? && player.blackjack?
          player.push!
        elsif @dealer.point_total == player.point_total
          player.push!
        elsif @dealer.point_total > player.point_total
          player.lose!
        elsif player.bust?
          player.lose!
        end
      end
    end
  end
end
