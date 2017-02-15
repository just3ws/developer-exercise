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
      puts

      # if game.dealer.hand.blackjack?
      #   game.boxes.each(&:dealer_blackjack!)

      # elsif game.dealer.hand.bust?
      #   game.boxes.reject(&:lost?).each(&:dealer_bust!)
      # end

      # puts game.boxes.map(&:play_state)

      # puts game.dealer.hand.point_total

      # @board.merge(@game.boxes.group_by(&:play_state))

      # if @game.dealer.hand.point_total.equal?(21)
      #   handle_dealer_twenty_one
      # elsif dealer_bust?
      #   if_dealer_bust
      # else

      #   if_dealer_showdown

      # end

      # puts

      # LOG.ap(@game.dealer.hand.twenty_one?)
      # LOG.ap(@game.dealer.hand.bust?)
      # LOG.ap(@game.dealer.hand.point_total)
      # LOG.ap(@losers.map { |player| [player.play_state, player.hand.point_total] })
      # LOG.ap(@winners.map { |player| [player.play_state, player.hand.point_total] })
      # LOG.ap(@unknowns.map { |player| [player.play_state, player.hand.point_total] })
    end

    def dealer_blackjack?; end

    def dealer_bust?
      @game.dealer.hand.bust?
    end

    def dealer_showdown?
      # dealer is not blackjack
      # dealer is not bust
      # no player has blackjack
      # any player has not bust
    end

    def handle_dealer_twenty_one
      @board[:lost] |= @board[:unknown]
      @board.delete(:unknowns)

      @dealer

      @game.dealer.push! if @winners.any?
      @winners.each(&:push!)
      @ties |= @winners
      @winners.clear
      @unknowns.clear
    end

    def if_dealer_bust
      @winners |= @unknowns
      @unknowns.clear
    end

    def if_dealer_showdown
      points_to_beat = @game.dealer.hand.point_total

      puts

      winners, unknowns = split_showdown_winners_from_rest

      @unknowns.group_by do |player|
        player.hand.point_total > @game.dealer.hand.point_total
      end

      if winners.any?
        @winners |= winners.map(&:win!)
        ws.clear

        @losers |= maybes.map(&:lose!)
        maybes.clear

        @game.dealer.lose! if @winners.any?

        @unknowns.clear
      elsif maybes.any?
        ts, ls = @unknowns.partition do |player|
          player.hand.point_total == @game.dealer.hand.point_total
        end

        @ties |= ts.map(&:push!)
        ts.clear

        @losers |= ls.map(&:lose!)
        ls.clear

        # game.dealer.push! if @winners.none? && @ties.any?
        # game.dealer.win! if @winners.none? && @ties.none?
        # game.dealer.lose! if @winners.any?

        @unknowns.clear
      end
    end

    def split_showdown_winners_from_rest
      # [ [winners], [unknowns] ]
    end
  end
end
