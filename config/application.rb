require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Readysetgo
  class Application < Rails::Application
    config.time_zone = 'Eastern Time (US & Canada)'
  end
end
