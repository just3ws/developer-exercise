# frozen_string_literal: true
require_relative '../blackjack'

module BasicStrategy
  def decide!
    suggestion = Rules::Soft17Rules.new(facts).suggest

    puts
  end
end
