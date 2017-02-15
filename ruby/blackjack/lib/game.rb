# frozen_string_literal: true

class Game
  attr_accessor :game

  def initialize(game:)
    @game = game
  end

  def run
    LOG.alert("Beginning game with #{game.boxes.count} player(s)", line: :before)

    Phases::PlayersPhase.new(game: game).run
    Phases::DealersPhase.new(game: game).run
    Phases::ResolutionPhase.new(game: game).run

    LOG.alert("End of game with #{game.boxes.count} player(s)", line: :after)
  end
end
