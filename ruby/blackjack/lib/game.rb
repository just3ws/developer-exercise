# frozen_string_literal: true

class Game
  attr_accessor :game

  def initialize(game:)
    @game = game
  end

  def run
    LOG.debug('Game#run'.red)
    LOG.debug(game.as_json.to_s.light_yellow)

    Phases::PlayersPhase.new(game: game).run
  end
end
