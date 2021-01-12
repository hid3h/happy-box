class SessionsController < ApplicationController
  # If you're using a strategy that POSTs during callback, you'll need to skip the authenticity token check for the callback action only. 
  skip_before_action :verify_authenticity_token, only: :create

  def create
    p "きてます！", auth_hash
    user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = user.id
    redirect_to home_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
