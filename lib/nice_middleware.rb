class NiceMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    # [200, {"Content-Type" => 'text/html'}, ["lalala"]]

    status, headers, response = @app.call(env)

    [417, { 'lala' => 'lala' }.merge(headers), ["LALALA" + response.body]]
  end
end
