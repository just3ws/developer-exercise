# frozen_string_literal: true

require_relative 'deck_of_cards'
require_relative 'shuffling_device'
require_relative 'shoe'
require 'ostruct'

module House
  def self.withdraw(number)
    OpenStruct.new(decks: Array.new(number) { DeckOfCards.new.open })
  end
end
