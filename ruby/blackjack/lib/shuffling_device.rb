# frozen_string_literal: true

require_relative 'card'

module ShufflingDevice
  def self.shuffle!(decks)
    decks.flatten!
    decks.shuffle!
  end
end
