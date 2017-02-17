# frozen_string_literal: true
module Questions
  class WhatIsYourNameQuestion
    attr_reader :answer

    def self.ask
      new.tap(&:ask)
    end

    def then_wait_for
      try_to_understand(their_response: gets) until responded? && answered?

      self
    end

    def ask
      print question

      self
    end

    private

    include Text

    def question
      <<~QUESTION
        Please enter your name then press [ENTER]:
      QUESTION
    end

    def did_not_understand_message
      return "Sorry. I don't understand." if @normalized_response.empty?
      "Sorry. I don't understand what you mean by \"#{trim(@what_they_said)}\"."
    end

    def responded?
      !(@normalized_response.nil? || @normalized_response.empty?)
    end

    def we_do_not_need_to_ask_again
      @what_they_said = 'Guest'
      @answer = 'Guest'
    end

    def answered?
      !(@answer.nil? || @answer.empty?)
    end

    def try_to_understand(their_response:)
      @what_they_said = their_response.to_s
      @normalized_response = clean(their_response)
      @answer = if @normalized_response.empty?
                  @what_they_said = 'Guest'
                  @normalized_response = 'guest'
                  'Guest'
                else
                  @normalized_response.split(/\s+/).map(&:capitalize).join(' ')
                end

      we_do_not_need_to_ask_again unless answered?
    end
  end
end
