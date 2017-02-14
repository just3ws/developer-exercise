# frozen_string_literal: true

require 'forwardable'

class Shoe
  extend Forwardable

  def initialize(cards = [])
    @cards = cards
  end

  def draw
    @cards.delete_at(rand(@cards.count))
  end

  def_delegators :@cards, :count

  def facts
    {
      shoe: {
        count: @cards.count
      }
    }
  end
end
