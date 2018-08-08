class HomeController < ApplicationController
  def index
    sleep(rand(1..5))
  end
end
