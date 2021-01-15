class HappinessCardsController < ApplicationController
  def new
    @happiness_card = HappinessCard.new
  end

  def create(happiness_card)
    HappinessCard.add(
      user:    current_user,
      message: create_params[:message]
    )
    redirect_to root_path
  rescue ActiveRecord::RecordInvalid => e
    p e.message
    @happiness_card = HappinessCard.new(create_params.to_h)
    render :new
  end

  def show
    
  end

  private

  def create_params
    params.required(:happiness_card).permit(:message)
  end
end
