class UsersController < ApplicationController
  skip_before_action :authenticate
  
  def show
    user = User.find_by!(screen_name: params[:screen_name])

    @happiness_cards_count_by_month = HappinessCard.count_by_month(user: user)
    @happiness_cards_count_by_year  = HappinessCard.count_by_year(user: user)
    
    @is_mypage = current_user == user
  end
end
