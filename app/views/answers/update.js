<% if @answer.errors.any? %>
  console.log("update error. id:<%= @answer.id %>")
<% else %>
  console.log("updated id:<%= @answer.id %>")
<% end %>