# frozen_string_literal: true
require_relative 'blackjack'

class Table
  attr_accessor :boxes, :dealer, :shoe

  def initialize(dealer: nil)
    @dealer = dealer
    @shoe = Shoe.new
    @boxes = []
  end

  def run
    raise 'Game is not ready to start' unless ready?

    @dealer.prepare_for_game

    Game.new(game: self).run
  end

  def accept(player:)
    raise 'No dealer to accept player' unless dealer?

    @boxes << player
  end

  def ready?
    dealer? && players?
  end

  def dealer?
    @dealer.instance_of?(Dealer)
  end

  def players?
    @boxes.any? && @boxes.all? { |box| box.instance_of?(Player) }
  end

  def as_json
    {
      table: {
        boxes: boxes.map(&:facts)
      }
        .merge(dealer.facts)
        .merge(shoe.facts)
    }
  end
end
