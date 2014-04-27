<% if @bet.errors.any? %>
  console.log("update error. id:<%= @bet.id %>")
<% else %>
  console.log("updated id:<%= @bet.id %>")
<% end %>