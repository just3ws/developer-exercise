# frozen_string_literal: true

require 'logger'
require 'awesome_print'
require 'awesome_print/core_ext/logger'

module Log
  def self.to=(device)
    @logger = device
  end

  def self.to
    @logger
  end
end

Log.to = Logger.new($stdout).tap do |log|
  log.progname = 'blackjack'
end
