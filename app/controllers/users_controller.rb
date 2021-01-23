class UsersController < ApplicationController
  skip_before_action :authenticate
  
  def show
    # viewにな雨とか表示かな？
    @user = User.find_by!(screen_name: params[:screen_name])

    @happiness_cards_count_by_month = HappinessCard.count_by_month(user: @user)
    @happiness_cards_count_by_year  = HappinessCard.count_by_year(user: @user)
    
    @is_mypage = current_user == @user

    @page_title = @user.name + 'さんのしあわせ貯金箱'

    return if flash[:twitter_share].blank?
  
    @twitter_share_text = "しあわせ貯金に追加しました%0a%0a#{@page_title}%0a#{user_url(@user.screen_name)}%0a%0a"
    @twitter_hashtags   = t("twitter_hashtag")
  end
end
