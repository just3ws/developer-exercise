# frozen_string_literal: true

class Card
  attr_reader :suit, :name, :rank

  def initialize(suit: nil, name: nil, rank: nil, downcard: true)
    @suit = suit
    @name = name
    @rank = rank
    @downcard = downcard
  end

  def upcard!
    @downcard = false

    self
  end

  def upcard?
    !@downcard
  end

  def downcard?
    @downcard
  end

  def as_token
    return 'A' if name == :ace
    rank.to_s.rjust(2, '0')
  end

  def facts
    { name: @name }
  end
end
