# frozen_string_literal: true
module StateReaders
  def won?
    WIN_STATES.include?(@state)
  end

  def lost?
    LOSS_STATES.include?(@state)
  end

  def draw?
    DRAW_STATES.include?(@state)
  end

  def unknown?
    @state.equal?(DEFAULT_STATES)
  end
end
