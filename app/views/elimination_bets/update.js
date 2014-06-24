<% if @elimination_bet.errors.any? %>
  $("#edit_elimination_bet_<%= @elimination_bet.id %>").find("input").css("color", "red")
<% else %>
  $("#edit_elimination_bet_<%= @elimination_bet.id %>").find("input").css("color", "green")
<% end %>