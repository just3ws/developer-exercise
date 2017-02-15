# frozen_string_literal: true

require 'logger'

module Blackjack
  class << self
    attr_accessor :logger
  end
end

log_file = open("log/#{ENV.fetch('BLACKJACK_ENV', 'development')}.log", File::WRONLY | File::APPEND | File::CREAT).tap do |f|
  f.sync = true
end

Blackjack.logger = Logger.new(log_file).tap do |log|
  log.progname = "[blackjack-#{ENV.fetch('BLACKJACK_ENV', 'development')}]"
end

Blackjack.logger.formatter = proc do |_severity, _datetime, _progname, msg|
  "#{msg}\n"
end
