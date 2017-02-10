
# frozen_string_literal: true
module Blackjack
  class Card
    attr_accessor :suite, :name, :value

    def initialize(suite, name, value)
      @suite = suite
      @name = name
      @value = value
    end
  end
end
