# frozen_string_literal: true

module Phases
  class DealersPhase
    include States::DecisionState

    attr_accessor :game

    def initialize(game:)
      @game = game
    end

    def run
      deal_an_upcard_to_the_dealer

      Blackjack.logger.info { 'Beginning turn for Dealer' }

      22.times do |turn_guard|
        raise 'INCONCEIVABLE!' if turn_guard >= 21

        Blackjack.logger.info("Dealer is holding #{game.dealer.hand.description}")

        decision = game.dealer.decide

        case decision
        when STAND
          Blackjack.logger.info('Dealer has decided to STAND')
        when HIT
          Blackjack.logger.info('Dealer has decided to HIT')
          deal_an_upcard_to_the_dealer
        end

        if game.dealer.hand.bust?
          game.dealer.bust!
        elsif game.dealer.hand.blackjack?
          game.dealer.blackjack!
        elsif game.dealer.hand.twenty_one?
          game.dealer.twenty_one!
        end

        Blackjack.logger.info("Dealer state is #{game.dealer.play_state}")

        next unless game.dealer.done?

        Blackjack.logger.debug("Dealer has hand: #{game.dealer.hand.description}")

        Blackjack.logger.info { "Dealer turn is #{game.dealer.turn_state}" }

        break
      end

      Blackjack.logger.info('End of turn for Dealer')
    end

    def deal_an_upcard_to_the_dealer
      game.dealer.deal_upcard_to(game.dealer)
    end
  end
end
