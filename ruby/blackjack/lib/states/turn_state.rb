# frozen_string_literal: true

module States
  module TurnState
    attr_accessor :turn_state

    CONTINUE = :continue
    DONE = :done

    def set_initial_turn_state!
      @turn_state = CONTINUE
    end

    # Turn
    def done!
      @turn_state = DONE
    end

    def done?
      @turn_state.equal?(DONE)
    end

    def continue?
      @turn_state.equal?(CONTINUE)
    end
  end
end
