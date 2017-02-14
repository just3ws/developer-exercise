# frozen_string_literal: true

class Game
  attr_accessor :game
  def initialize(game:)
    @game = game
  end

  def run
    Phases::PlayersPhase.new(game: game).run
  end
end
