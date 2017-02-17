# frozen_string_literal: true

class Hand
  attr_accessor :cards

  IS_ACE ||= ->(card) { card.name.equal?(:ace) }

  def initialize
    @cards = []
  end

  def dealt(card)
    cards << card
  end

  def hard?
    cards.none?(&IS_ACE) || hard_count > 11
  end

  def soft?
    cards.any?(&IS_ACE) && hard_count <= 11
  end

  def hard_count
    cards.reject(&IS_ACE).map(&:rank).sum +
      cards.count(&IS_ACE)
  end

  def point_total
    return hard_count if hard?
    # Treat Ace as 11 if possible.
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

  def twenty_one?
    cards.count > 2 && point_total.equal?(21)
  end

  def blackjack?
    cards.count == 2 && point_total.equal?(21)
  end

  def type
    return 'Hard' if hard?
    return 'Soft' if soft?
    ''
  end

  def description
    "#{type} #{point_total} built from #{cards.count} cards: #{cards.map(&:for_humans).join(', ')}"
  end

  def as_graph
    {
      hand: {
        pair?: pair?,
        count: cards.count,
        twenty_one?: twenty_one?,
        blackjack?: blackjack?,
        bust?: bust?,
        point_total: point_total,
        hard_count: hard_count,
        hard?: hard?,
        soft?: soft?,
        type: type,
        description: description,
        cards: cards.map(&:as_graph)
      }
    }
  end
end
