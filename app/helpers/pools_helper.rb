module PoolsHelper
  def highlight_current_user(value, method)
    "highlight" if current_user.send(method) == value
  end

  def my_bets_button
    link_to "#", class: "btn btn-default dropdown-toggle", data: { toggle: "dropdown" } do
      raw("Ver mis Apuestas ") + content_tag(:span, nil, class: "caret")
    end
  end
end
