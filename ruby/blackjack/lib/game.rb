# frozen_string_literal: true

class Game
  attr_accessor :game

  def initialize(game:)
    @game = game
  end

  def run
    Blackjack.logger.info { "Beginning game with #{game.boxes.count} player(s)" }

    Phases::PlayersPhase.new(game: game).run
    Phases::DealersPhase.new(game: game).run
    Phases::ResolutionPhase.new(game: game).run

    Blackjack.logger.info { "End of game with #{game.boxes.count} player(s)" }
  end
end
