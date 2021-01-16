class ApplicationController < ActionController::Base
  before_action :authenticate
  before_action :set_turbolinks_header
  helper_method :logged_in?, :current_user

  private

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def authenticate
    return if logged_in?
    redirect_to root_path, alert: "ログインしてください"
  end

  # https://nisshiee.hatenablog.jp/entry/2017/04/19/195253
  # turbolinksnでリダイレクトした時にurlが変わらないのを解決
  def set_turbolinks_header
    response.set_header('Turbolinks-Location', request.fullpath)
  end
end
