class HomeController < ApplicationController
  def index
    sleep(rand(1..10))
  end
end
