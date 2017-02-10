# frozen_string_literal: true

require 'forwardable'

class Shoe
  extend Forwardable

  def initialize(cards = [])
    fill_with(cards: cards)
  end

  def_delegators :@cards, :count

  def draw
    @cards.delete_at(rand(count))
  end

  protected

  def fill_with(cards:)
    @cards = cards
  end
end
