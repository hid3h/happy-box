class HappinessCardsController < ApplicationController
  def index
    @happiness_cards = current_user.happiness_cards.recently
  end

  def new
    @happiness_card = HappinessCard.new
  end

  def create(happiness_card)
    HappinessCard.add(
      user:    current_user,
      message: create_params[:message]
    )
    redirect_to happiness_cards_path
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
