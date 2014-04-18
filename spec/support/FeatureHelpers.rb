module FeatureHelpers

  def login(user)
    visit new_user_session_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "login"
  end

  def chosen_select(value, options = {})
    if options.has_key?(:from)
      from = options.delete(:from)
      page.execute_script("$('##{from}').val('#{value}').trigger('chosen:updated');")
    end
  end

  def click_submit_button
    find("input[type='submit']").click
  end

  def click_delete_link(path)
    find("a[data-method='delete'][href='#{path}']").click
  end
end
