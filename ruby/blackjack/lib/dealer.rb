# frozen_string_literal: true

require 'strategies/stand_on_17_strategy'

class Dealer
  attr_accessor :hand, :game

  include States::PlayState
  include States::TurnState
  include States::DecisionState
  include Strategies::StandOn17Strategy

  def initialize
    set_initial_play_state!
    set_initial_turn_state!
    set_initial_decisions_state!

    @hand = Hand.new
  end

  def deal_upcard_to(player)
    player.hand.dealt(game.shoe.draw.upcard!)
  end

  def deal_downcard_to(player)
    player.hand.dealt(game.shoe.draw)
  end

  def take_ownership_of(game:)
    @game = game
    game.dealer = self
  end

  def prepare_for_game
    game.shoe = Shoe.new(Deck.new.open)
  end

  def upcard
    hand.cards.first(&:upcard?)
  end

  def as_graph
    {
      dealer: {
        upcard: upcard&.as_graph
      }.merge(hand.as_graph)
    }
  end
end
