class UnicornMiddleware
  UNICORN_TIMEOUT = 5

  def initialize(app)
    @app = app
  end

  def call(env)
    thread = Thread.new do
      sleep(UNICORN_TIMEOUT - 0.5)
      unless thread[:done]
        request = Rack::Request.new(env)
        Rails.logger.info { request.ip }
        Rails.logger.info { request.path_info }
        Rails.logger.info { request.params }
      end
    end

    @app.call(env)
  ensure
    thread[:done] = true
    thread.run
  end
end
