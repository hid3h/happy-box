module ApplicationHelper
  def hbr(str)
    safe_join(str.split("\n"), tag(:br))
  end
end
