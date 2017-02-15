# frozen_string_literal: true

require 'colorize'

require 'warning'
Warning.ignore(:fixnum)

require 'blackjack'

log_file = open('log/test.log', File::WRONLY | File::APPEND | File::CREAT).tap do |f|
  f.sync = true
end

Blackjack.logger = Logger.new(log_file).tap do |log|
  log.progname = '[T]'.blue
end

Blackjack.logger.formatter = proc do |_severity, _datetime, _progname, msg|
  "#{msg}\n"
end

LOG = Blackjack.logger

def LOG.here(instance, separator: '#')
  debug("#{instance.class.name.colorize(color: :light_blue)}#{separator}#{caller[0][/`.*'/][1..-2].colorize(color: :green)}".colorize(background: :black))
end

def LOG.graph_for(graphable)
  debug(graphable.as_json.to_s.colorize(color: :yellow).to_s)
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!

  config.warnings = false

  config.order = :random
end
