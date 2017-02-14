# frozen_string_literal: true

class Shoe
  attr_accessor :cards

  def initialize(cards = [])
    @cards = cards
  end

  def draw
    @cards.delete_at(rand(@cards.count))
  end

  def as_json
    {
      shoe: {
        cards: {
          count: @cards.count
        }
      }
    }
  end
end
