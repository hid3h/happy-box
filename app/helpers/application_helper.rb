module ApplicationHelper
  def hbr(str)
    safe_join(str.split("\n"), tag(:br))
  end

  def twitter_profile_link(screen_name)
    "https://twitter.com/#{screen_name}"
  end
end
