# frozen_string_literal: true

require 'strategies/hit_on_soft_17_strategy'

class VirtualPlayer < Player
  include Strategies::HitOnSoft17Strategy

  def initialize
    @name = Blackjack::NAMES.sample

    super()
  end
end
