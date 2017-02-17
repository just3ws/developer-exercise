# frozen_string_literal: true

require 'logger'

module Blackjack
  class << self
    attr_accessor :logger
  end
end

Blackjack.logger = Logger.new(STDOUT)

Blackjack.logger.formatter = proc do |_severity, _datetime, _progname, msg|
  "#{msg}\n"
end
