class HomeController < ApplicationController
  def index
    @happy_amounts = [
      1,
      10,
      4,
      50,
      3,
      100
    ]
  end
end
