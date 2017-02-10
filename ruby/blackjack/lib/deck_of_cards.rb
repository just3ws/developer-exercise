# frozen_string_literal: true

require_relative 'card'

# TODO: Decks/Cards shouldn't really know what their values are at this point.
#       A standard deck of cards can be defined here but should be decorated
#       somewhere by the game.
#
#       ex. Blackjack face cards are 10 and Ace is conditional with no Joker.

class DeckOfCards
  SUITS = %i(hearts diamonds spades clubs).freeze
  NAME_RANKS = {
    two: 2, three: 3, four: 4,
    five: 5, six: 6, seven: 7,
    eight: 8, nine: 9, ten: 10,
    jack: 10, queen: 10, king: 10,
    ace: [11, 1]
  }.freeze

  def open
    SUITS.each_with_object([]) do |suit, deck|
      NAME_RANKS.each_pair do |name, rank|
        deck << Card.new(
          suit: suit,
          name: name,
          rank: rank
        )
      end
    end
  end
end
