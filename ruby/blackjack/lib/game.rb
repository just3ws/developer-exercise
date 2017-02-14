# frozen_string_literal: true

class Game
  attr_accessor :game

  def initialize(game:)
    @game = game
  end

  def run
    LOG.info("Beginning game with #{game.boxes.count} player(s)")
    Phases::PlayersPhase.new(game: game).run
    LOG.info("End of game with #{game.boxes.count} player(s)")
  end
end
