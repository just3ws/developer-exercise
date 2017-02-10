# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blackjack/version'

Gem::Specification.new do |spec|
  spec.name          = 'blackjack'
  spec.version       = Blackjack::VERSION
  spec.authors       = ['Mike Hall']
  spec.email         = %w(mike@just3ws.com)

  spec.summary       = 'Simulates a basic game of Blackjack'
  spec.description   = 'Rudimentary implemenation of a Blackjack simulator'
  spec.homepage      = 'http://www.just3ws.com'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'http://push.not.allowed.to.any.host.com'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.47.1'
  spec.add_development_dependency 'rspec', '~> 3.5.0'
  spec.add_development_dependency 'fuubar', '~> 2.1.0'
  spec.add_development_dependency 'awesome_print', '~> 1.7.0'
  spec.add_development_dependency 'guard-rspec', '~> 4.7.3'
  spec.add_development_dependency 'pry', '~> 0.10.4'
  spec.add_development_dependency 'pry-byebug', '~> 3.4.2'
end
