# frozen_string_literal: true

class Player
  attr_accessor :hand, :game

  include PlayState
  include TurnState
  include DecisionState

  def initialize
    set_initial_play_state!
    set_initial_turn_state!
    set_initial_decisions_state!

    @hand = Hand.new
  end

  def decide
    decision = if hand.soft? && hand.point_total < 17
                 # Hit on Soft 17
                 hit!
               elsif hand.point_total <= 11
                 # Hit on 11
                 hit!
               else
                 stand!
               end

    decisions.push({
      decision: decision, done?: done?
    }.merge(hand.as_graph))

    decision
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
