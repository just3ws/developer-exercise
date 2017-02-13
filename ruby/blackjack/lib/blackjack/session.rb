# frozen_string_literal: true

# require_relative '../../../log'

module Blackjack
  class Session
    PHASES = [%i(
      players_phase
      dealer_phase
      showdown_phase
    )].freeze

    def initialize(game:)
      @dealer = game.dealer
      @boxes = game.boxes
    end

    def run
      # PHASES.each {|phase| send(phase) }
      players_phase
    end

    def players_phase
      @boxes.each do |player|
        @dealer.deal_upcard_to(player)
      end

      @dealer.deal_upcard_to(@dealer)

      @boxes.each do |player|
        Log.to.debug { player.for_log }
        @dealer.deal_upcard_to(player)
      end

      @dealer.deal_downcard_to(@dealer)

      @boxes.each do |player|
        Log.to.debug { player.for_log }

        22.times do |i|
          raise 'INCONCEIVABLE!' if i >= 21

          break if player.stand?

          @dealer.deal_upcard_to(player) if player.hit?

          if player.blackjack?
            player.blackjack!
            break
          end

          if player.bust?
            player.bust!
            break
          end
        end
      end
    end

    def dealer
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
