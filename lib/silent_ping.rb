# frozen_string_literal: true

require "silent_ping/version"
require "silent_ping/logger"
require "silent_ping/pong"

module SilentPing
  class Engine < ::Rails::Engine
    config.silent_ping = true

    initializer :silent_ping do |app|
      next unless app.config.silent_ping

      app.middleware.swap ::Rails::Rack::Logger, ::SilentPing::Logger
      app.middleware.use ::SilentPing::Pong
    end
  end
end
