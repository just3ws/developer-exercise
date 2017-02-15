# frozen_string_literal: true
module TurnStates
  def turn_done!
    @turn_done = true
  end

  def start_turn!
    @turn_done = false
  end
end
