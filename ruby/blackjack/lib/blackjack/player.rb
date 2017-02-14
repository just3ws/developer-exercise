# frozen_string_literal: true

require 'forwardable'

require_relative 'hand'

require_relative 'strategies/basic_strategy'

module Blackjack
  class Player
    extend Forwardable

    include Strategies::BasicStrategy

    attr_reader :hand, :action, :tally

    def initialize
      @hand = Hand.new
      @tally = 0
      @action = nil
    end

    def decide
      raise NotImplementedError
    end

    def holding
      raise NotImplementedError
    end

    def won?
      @tally.equal?(1)
    end

    def lost?
      @tally.equal?(-1)
    end

    def draw?
      @tally.equal?(0)
    end

    def win!
      @tally = 1
    end

    def lose!
      @tally = -1
    end

    def draw!
      @tally = 0
    end

    def enter(game:)
      @game = game
      @game.welcome(player: self)
    end

    def facts
      {
        player: {
          tally: tally
        }.merge(hand.facts)
      }
    end
  end
end
