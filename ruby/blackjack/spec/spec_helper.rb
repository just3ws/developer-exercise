# frozen_string_literal: true

ENV['BLACKJACK_ENV'] ||= 'test'

require 'colorize'

require 'warning'
Warning.ignore(:fixnum)

require 'blackjack'

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
