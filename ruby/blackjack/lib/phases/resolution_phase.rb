# frozen_string_literal: true

module Phases
  class ResolutionPhase
    attr_accessor :game

    attr_accessor :game, :losers, :winners, :ties, :unknown

    def initialize(game:)
      @game = game

      @losers = []
      @winners = []
      @unknown = []
      @ties = []
    end

    def run
      @losers = game.boxes.select(&:lost?)
      @winners = game.boxes.select(&:won?)
      @unknown = game.boxes.select(&:unknown?)

      if dealer_won?
        if_dealer_won
      elsif dealer_lost?
        if_dealer_lost
      elsif dealer_unknown?
        if_dealer_unknown
      end
    end

    def dealer_won?
      game.dealer.hand.won?
    end

    def dealer_lost?
      game.dealer.hand.lost?
    end

    def dealer_unknown?
      game.dealer.hand.unknown?
    end

    def if_dealer_won
      # unknowns lose
      @losers |= @unknowns
      @unknowns.clear

      game.dealer.push! if @winners.any?
      @winners.each(&:push!)
      @ties |= @winners
      @winners.clear
      @unknowns.clear
    end

    def is_dealer_lost
      @winners |= @unknowns
      @unknowns.clear
    end

    def if_dealer_showdown
      ws, maybes = @unknowns.partition do |player|
        player.hand.point_total > game.dealer.hand.point_total
      end

      if ws.any?
        dealer.lose!
        @winners |= ws.map(&:win!)
        ws.clear
        @losers |= maybes.map(&:lose!)
        maybes.clear

        @unknowns.clear
      elsif maybes.any?
        ts, ls = @unknowns.partition do |player|
          player.hand.point_total == game.dealer.hand.point_total
        end

        @ties |= ts.map(&:push!)
        ts.clear
        @losers |= ls.map(&:lose!)
        ls.clear

        @unknowns.clear
      end
    end
  end
end
