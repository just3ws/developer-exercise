# frozen_string_literal: true

require 'forwardable'

module Blackjack
  class Hand
    extend Forwardable

    attr_reader :cards

    def initialize
      @cards = []
    end

    def dealt(card)
      @cards << card
    end

    def hard?
      cards.none? { |card| card.name == :ace } || hard_count > 11
    end

    def soft?
      cards.any? { |card| card.name == :ace } && hard_count <= 11
    end

    def hard_count
      cards.reject { |card| card.name == :ace }.map(&:rank).sum +
        count { |card| card.name == :ace }
    end

    def point_total
      return hard_count if hard?
      hard_count + 10
    end

    def pair?
      return false if count != 2
      cards.map(&:rank).uniq.one?
    end

    def bust?
      hard_count > 21
    end

    def blackjack?
      return true if hard_count == 21
      return true if hard_count == 11 && cards.any? { |card| card.name == :ace }

      false
    end

    def natural_blackjack?
      count == 2 && blackjack?
    end

    def_delegators :@cards, :count
  end
end
