# frozen_string_literal: true

class Game
  attr_accessor :game

  def initialize(game:)
    @game = game
  end

  def run
    LOG.here(self)
    LOG.graph_for(game)

    Phases::PlayersPhase.new(game: game).run
  end
end
