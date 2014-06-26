module PoolsHelper
  def highlight_current_user(value, method)
    "highlight" if current_user.send(method) == value
  end

  def dropdown_button(name)
    link_to "#", class: "btn btn-default dropdown-toggle", data: { toggle: "dropdown" } do
      raw("#{name} ") + content_tag(:span, nil, class: "caret")
    end
  end

  def div_for_elimination_match(match)
    content_tag(:div, class: "elimination_match center-block", id: match.id,
      data: { match_to_winner: match.match_to_winner, match_to_loser: match.match_to_loser,
      select: match.select, round: match.round }) do
        yield
      end
  end
end
