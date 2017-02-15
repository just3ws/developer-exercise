# frozen_string_literal: true

require 'pry'
require 'logger'
require 'awesome_print'
require 'awesome_print/core_ext/logger'

class << self
  attr_accessor :logger
end

module Blackjack
  class << self
    attr_accessor :logger
  end
end

require 'card'
require 'deck'
require 'shoe'

require 'hand'
require 'game'
require 'table'

# require 'rules/soft_17_rules'

require 'play_state'

require 'dealer'
# require 'strategies/dealer_strategy'

require 'player'
require 'phases/players_phase'
require 'phases/dealers_phase'
require 'phases/resolution_phase'
