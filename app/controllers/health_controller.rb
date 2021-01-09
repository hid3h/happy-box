class HealthController < ApplicationController
  def index
    render json: {happy: 'ok'}
  end
end
