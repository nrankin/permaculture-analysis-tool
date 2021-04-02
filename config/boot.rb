# ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])# Set up gems listed in the Gemfile.
# require 'bootsnap/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])# Speed up boot time by caching expensive operations.
