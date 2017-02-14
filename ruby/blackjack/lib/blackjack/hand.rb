# frozen_string_literal: true

module Blackjack
  class Hand
    attr_reader :cards

    ACE ||= ->(card) { card.name.equal?(:ace) }

    def initialize
      @cards = []
    end

    def dealt(card)
      cards << card
    end

    def hard?
      cards.none?(&ACE) || hard_count > 11
    end

    def soft?
      cards.any?(&ACE) && hard_count <= 11
    end

    def hard_count
      cards.reject(&ACE).map(&:rank).sum +
        cards.count(&ACE)
    end

    def point_total
      return hard_count if hard?
      # Treat Ace as 11.
      # Short hand for `(hard_count - 1) + 11`
      10 + hard_count
    end

    def pair?
      return false unless cards.count == 2
      cards.map(&:rank).uniq.one?
    end

    def bust?
      hard_count > 21
    end

    def blackjack?
      point_total.equal?(21)
    end

    def natural?
      cards.count == 2 && blackjack?
    end

    def as_json
      {
        hand: {
          pair?: pair?,
          count: cards.count,
          blackjack?: blackjack?,
          bust?: bust?,
          point_total: point_total,
          hard_count: hard_count,
          hard?: hard?,
          soft?: soft?
        }.merge(cards: cards.map(&:as_json))
      }
    end
  end
end
