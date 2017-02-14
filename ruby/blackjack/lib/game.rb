# frozen_string_literal: true

class Game
  attr_accessor :game

  def initialize(game:)
    @game = game
  end

  def run
    ap game.as_json

    binding.pry
    puts

    Phases::PlayersPhase.new(game: game).run
  end
end
