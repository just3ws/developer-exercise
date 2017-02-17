# frozen_string_literal: true

require_relative '../states/decision_state'

module Questions
  class HitOrStandQuestion
    include States::DecisionState

    attr_reader :answer

    def self.ask
      new.tap(&:ask)
    end

    def then_wait_for
      try_to_understand(their_response: gets) until responded? && answered?

      self
    end

    def ask
      puts question

      self
    end

    private

    include Text

    def question
      <<~QUESTION
        Do you want to hit or stand?
        Type "h" or "hit" to receive another card.
        Type "s" or "stand" to end your turn.
        Press [ENTER] to continue
      QUESTION
    end

    def did_not_understand_message
      return "Sorry. I don't understand." if @normalized_response.empty?
      "Sorry. I don't understand what you mean by \"#{trim(@what_they_said)}\"."
    end

    def responded?
      !(@normalized_response.nil? || @normalized_response.empty?)
    end

    def we_need_to_ask_again
      puts did_not_understand_message
      puts question

      @what_they_said&.clear
      @answer&.clear
    end

    def answered?
      DECISION_STATES.include?(@answer)
    end

    def try_to_understand(their_response:)
      @what_they_said = their_response.to_s
      @normalized_response = clean(their_response)

      @answer = case @normalized_response
                when 'h', 'hit' then HIT
                when 's', 'stand', 'stay', 'stand pat' then STAND
                end

      we_need_to_ask_again unless answered?
    end
  end
end
