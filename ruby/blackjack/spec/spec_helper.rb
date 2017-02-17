# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

ENV['BLACKJACK_ENV'] ||= 'test'

require 'blackjack'

log_file_name = "log/#{ENV.fetch('BLACKJACK_ENV', 'development')}.log"
log_file = open(log_file_name, File::WRONLY | File::APPEND | File::CREAT).tap do |f|
  f.sync = true
end

Blackjack.logger = Logger.new(log_file).tap do |log|
  log.progname = "[blackjack-#{ENV.fetch('BLACKJACK_ENV', 'development')}]"
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
