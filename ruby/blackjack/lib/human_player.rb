# frozen_string_literal: true

require 'player'
require 'strategies/human_strategy'

class HumanPlayer < Player
  include Strategies::HumanStrategy

  def initialize(name:)
    @name = name

    super()
  end
end
