# frozen_string_literal: true

##
# Checks the ruby requirements.

raise StandardError, "Please, use Ruby 2.4" unless defined?(RUBY_ENGINE)
raise StandardError, "Only MRI is supported" unless RUBY_ENGINE == "ruby"

supported = Gem::Version.new(File.read(Rails.root.join(".ruby-version")))
current   = Gem::Version.new(RUBY_VERSION)

if current > supported
  Rails.logger.tagged("ruby") do
    Rails.logger.warn "Using #{RUBY_VERSION}, but we recommend #{supported}."
  end
elsif current < supported
  raise StandardError, "Please, use Ruby 2.4"
end
