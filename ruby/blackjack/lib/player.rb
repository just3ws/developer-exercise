# frozen_string_literal: true

class Player
  attr_accessor :hand, :game, :name

  include States::PlayState
  include States::TurnState
  include States::DecisionState

  def initialize
    set_initial_play_state!
    set_initial_turn_state!
    set_initial_decisions_state!

    @hand = Hand.new
  end

  def enter(game:)
    @game = game
    game.accept(player: self)
  end

  def as_graph
    dealer_upcard = {}.tap do |hash|
      unless game&.dealer&.upcard&.nil?
        hash.merge(game: {
                     dealer: {
                       upcard: game.dealer.upcard.as_graph
                     }
                   })
      end
    end

    {
      player: {
        play_state: play_state,
        decisions: decisions
      }.merge(hand.as_graph)
        .merge(dealer_upcard)
    }
  end
end
