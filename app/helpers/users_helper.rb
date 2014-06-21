module UsersHelper

  def display_user_pools(pools)
    li = ""
      li += content_tag(:span, "Quinielas:", class: "title")
      pools.each do |pool|
        li += content_tag :li  do
          content_tag(:span, pool.name, class: "label label-default")
        end
      end
    content_tag :ul, raw(li), class: "user-pool-list"
  end
end