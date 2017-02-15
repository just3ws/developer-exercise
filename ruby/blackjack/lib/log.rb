# frozen_string_literal: true

require 'logger'

module Blackjack
  class << self
    attr_accessor :log
  end
end

log_file = open("log/#{ENV.fetch('BLACKJACK_ENV', 'development')}.log", File::WRONLY | File::APPEND | File::CREAT).tap do |f|
  f.sync = true
end

Blackjack.log = Logger.new(log_file).tap do |log|
  log.progname = "[blackjack-#{ENV.fetch('BLACKJACK_ENV', 'development')}]"
end

Blackjack.log.formatter = proc do |_severity, _datetime, _progname, msg|
  "#{msg}\n"
end

LOG = Blackjack.log

def LOG.here(instance, separator: '#')
  debug("#{instance.class.name}#{separator}#{caller[0][/`.*'/][1..-2]}")
end

def LOG.graph(graphable)
  debug(graphable.as_graph.to_s)
end

def LOG.alert(msg, line: nil)
  formatted = case line
              when :before
                "\n#{msg}"
              when :after
                "#{msg}\n"
              when :both
                "\n#{msg}\n"
              else
                msg
              end
  info(formatted)
end
