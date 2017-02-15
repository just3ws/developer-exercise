# frozen_string_literal: true

require 'logger'
require 'colorize'

module Blackjack
  class << self
    attr_accessor :log
  end
end

log_file = open("log/#{ENV.fetch('BLACKJACK_ENV', 'development')}.log", File::WRONLY | File::APPEND | File::CREAT).tap do |f|
  f.sync = true
end

Blackjack.log = Logger.new(log_file).tap do |log|
  log.progname = "[blackjack-#{ENV.fetch('BLACKJACK_ENV', 'development')}]".blue
end

Blackjack.log.formatter = proc do |_severity, _datetime, _progname, msg|
  "#{msg}\n"
end

LOG = Blackjack.log

def LOG.here(instance, separator: '#')
  debug("#{instance.class.name.colorize(color: :light_blue)}#{separator}#{caller[0][/`.*'/][1..-2].colorize(color: :green)}".colorize(background: :black))
end

def LOG.graph(graphable)
  debug(graphable.as_graph.to_s.colorize(color: :yellow).to_s)
end

def LOG.alert(msg, line: nil)
  colorized = msg.colorize(color: :red, background: :white)
  formatted = case line
              when :before
                "\n#{colorized}"
              when :after
                "#{colorized}\n"
              when :both
                "\n#{colorized}\n"
              else
                colorized
              end
  info(formatted)
end
