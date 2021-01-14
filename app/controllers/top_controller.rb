class TopController < ApplicationController
  skip_before_action :authenticate
  
  def index
    return redirect_to user_path(current_user.screen_name) if logged_in?
  end
end
