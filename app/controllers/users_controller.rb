class UsersController < ApplicationController
  skip_before_action :authenticate
  
  def show
    # viewにな雨とか表示かな？
    @user = User.find_by!(screen_name: params[:screen_name])

    @happiness_cards_count_by_month = HappinessCard.count_by_month(user: @user)
    @happiness_cards_count_by_year  = HappinessCard.count_by_year(user: @user)
    
    @is_mypage = current_user == @user

    @page_title = @user.name + 'さんのしあわせグラフ'
  end
end
