# frozen_string_literal: true

require 'colorize'

# String.colors
# String.modes
# String.color_samples

require 'warning'
Warning.ignore(:fixnum)

require 'blackjack'

log_file = open('log/test.log', File::WRONLY | File::APPEND | File::CREAT).tap do |f|
  f.sync = true
end

Blackjack.logger = Logger.new(log_file).tap do |log|
  log.progname = '[T]'.blue
end

LOG = Blackjack.logger

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
