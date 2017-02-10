# frozen_string_literal: true

require 'forwardable'

require_relative 'hand'

require_relative 'strategies/basic_strategy'

module Blackjack
  class Player
    extend Forwardable
    include Strategies::BasicStrategy

    attr_reader :hand

    def initialize
      @hand = Hand.new
      @state = nil
    end

    def enter(game:)
      @game = game
      @game.welcome(player: self)
    end

    def_delegators :@hand, :bust?
    def_delegators :@hand, :blackjack?
    def_delegators :@hand, :dealt
  end
end
