class HealthController < ApplicationController
  skip_before_action :authenticate

  def index
    render json: {happy: 'ok'}
  end
end
