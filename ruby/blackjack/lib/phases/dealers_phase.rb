# frozen_string_literal: true

module Phases
  class DealersPhase
    include PlayState

    attr_accessor :game

    def initialize(game:)
      @game = game
    end

    def run
      deal_an_upcard_to_the_dealer

      LOG.info('Beginning turn for Dealer')

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

        if game.dealer.hand.bust?
          LOG.info("Dealer has #{game.dealer.state} by going bust")
        elsif game.dealer.hand.blackjack?
          LOG.info("Dealer has #{game.dealer.state} with blackjack")
        elsif game.dealer.hand.twenty_one?
          LOG.info("Dealer has #{game.dealer.state} with twenty_one")
        elsif game.dealer.hand.twenty_one?
          LOG.info("Dealer has #{game.dealer.state} by hitting #{game.dealer.hand.point_total}")
        else
          LOG.info("Dealer has #{game.dealer.hand.point_total} in hand so their win/lose/draw is #{game.dealer.state}")
        end

        next unless game.dealer.done?

        LOG.info("Dealer is done with their turn holding #{game.dealer.hand.description}")

        break
      end

      LOG.graph_for(game.dealer)
      LOG.info('End of turn for Dealer')
    end

    def deal_an_upcard_to_the_dealer
      game.dealer.deal_upcard_to(game.dealer)
    end
  end
end
