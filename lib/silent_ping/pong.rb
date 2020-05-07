# frozen_string_literal: true

module SilentPing
  class Pong
    PATH = "/ping".freeze

    def initialize(app)
      @app = app
    end

    def call(env)
      return @app.call(env) unless env["PATH_INFO"] == "/ping"

      [200, {}, ["pong"]]
    end
  end
end
