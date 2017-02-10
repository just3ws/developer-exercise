# frozen_string_literal: true

require 'forwardable'
require 'ostruct'

require_relative '../shoe'
require_relative 'hand'
require_relative 'strategies/dealer_strategy'

module Blackjack
  class Dealer
    extend Forwardable
    include Strategies::DealerStrategy

    attr_reader :hand

    def initialize
      @hand = Hand.new
    end

    def deal_upcard_to(player)
      player.dealt(@game.shoe.draw.upcard!)
    end

    def deal_downcard_to(player)
      player.dealt(@game.shoe.draw)
    end

    def take_ownership_of(game:)
      @game = game
      @game.dealer = self
    end

    def prepare_for_game(number: 1)
      @game.shoe = shuffle_and_fill_a_new_shoe_with(number).decks
    end

    def upcard
      hand.cards.first(&:upcard?)
    end

    def shuffle_and_fill_a_new_shoe_with(number)
      OpenStruct.new(
        decks: Shoe.new(
          ShufflingDevice.shuffle!(
            House.withdraw(number).decks
          )
        )
      )
    end

    # def_delegators :@hand, :count
    def_delegators :@hand, :dealt
    def_delegators :@game, :active?
  end
end
