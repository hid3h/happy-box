class UsersController < ApplicationController
  skip_before_action :authenticate
  
  def show
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
