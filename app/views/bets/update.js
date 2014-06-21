<% if @bet.errors.any? %>
  $("#edit_bet_<%= @bet.id %>").find(".input-bet").css("background-color", "#f2dede")
<% else %>
  $("#edit_bet_<%= @bet.id %>").find(".input-bet").css("background-color", "#dff0d8")
<% end %>