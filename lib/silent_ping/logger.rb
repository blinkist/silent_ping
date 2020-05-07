# frozen_string_literal: true

require "logger"

module SilentPing
  class Logger < ::Rails::Rack::Logger
    PATH = "/ping"
    KEY = "PRESERVE_LEVEL"

    def call(env)
      return super(env) unless env["PATH_INFO"] == PATH

      begin
        env[KEY] = ::Rails.logger.level
        ::Rails.logger.level = ::Logger::DEBUG
        @app.call(env)
      ensure
        ::Rails.logger.level = env[KEY] unless env[KEY].nil?
      end
    end
  end
end
