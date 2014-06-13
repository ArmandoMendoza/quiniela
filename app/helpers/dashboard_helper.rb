module DashboardHelper

  def highlight_current_user(value, method)
    "highlight" if current_user.send(method) == value
  end
end
