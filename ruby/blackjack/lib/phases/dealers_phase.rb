# frozen_string_literal: true

module Phases
  class DealersPhase
    include PlayState
    include TurnState
    include DecisionState

    attr_accessor :game

    def initialize(game:)
      @game = game
    end

    def run
      deal_an_upcard_to_the_dealer

      LOG.alert('Beginning turn for Dealer')

      22.times do |turn_guard|
        raise 'INCONCEIVABLE!' if turn_guard >= 21

        LOG.info("Dealer is holding #{game.dealer.hand.description}")

        decision = game.dealer.decide

        case decision
        when STAND
          LOG.info("Dealer has decided to #{'STAND'.colorize(color: :blue)}")
        when HIT
          LOG.info("Dealer has decided to #{'HIT'.colorize(color: :red)}")
          deal_an_upcard_to_the_dealer
        end

        if game.dealer.hand.bust?
          game.dealer.bust!
        elsif game.dealer.hand.blackjack?
          game.dealer.blackjack!
        elsif game.dealer.hand.twenty_one?
          game.dealer.twenty_one!
        end

        LOG.info("Dealer state is #{game.dealer.play_state}")

        next unless game.dealer.done?

        LOG.debug("Dealer has hand: #{game.dealer.hand.description}")

        LOG.alert("Dealer turn is #{game.dealer.turn_state}")

        break
      end

      LOG.info('End of turn for Dealer')
    end

    def deal_an_upcard_to_the_dealer
      game.dealer.deal_upcard_to(game.dealer)
    end
  end
end
