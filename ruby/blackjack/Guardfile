# frozen_string_literal: true

filter(/\.md$/, /\.DS_Store/, /Rakefile/, /\.gemspec$/, /Gemfile.*$/, /bin/, /tmp/)

# guard :rspec, cmd: :rspec, all_after_pass: true, all_on_start: true, notification: false, failed_mode: :focus do
guard :rspec, cmd: :rspec, all_after_pass: true, all_on_start: true, notification: false do
  require 'guard/rspec/dsl'

  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { 'spec' }

  Guard::RSpec::Dsl.new(self).tap do |dsl|
    watch(dsl.rspec.spec_helper) { dsl.rspec.spec_dir }
    watch(dsl.rspec.spec_files)

    dsl.watch_spec_files_for(dsl.ruby.lib_files)
  end
end
