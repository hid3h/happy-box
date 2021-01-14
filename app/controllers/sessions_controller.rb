class SessionsController < ApplicationController
  # If you're using a strategy that POSTs during callback, you'll need to skip the authenticity token check for the callback action only. 
  skip_before_action :authenticate, only: :create

  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = user.id
    redirect_to user_path(user.screen_name)
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "ログアウトしました"
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
