module ApplicationHelper

  def form_panel(title = "")
    content_tag(:div, class: "panel panel-default") do
      content_tag(:div, class: "panel-heading panel-dark") do
        content_tag(:span, title, class: "panel-title title-weight")
      end + content_tag(:div, class: "panel-body") { yield }
    end
  end

  def index_panel(title = nil, button_to_new = false, url_to_new ="#", url_to_back = :back)
    buttons = ""
    buttons << table_button(url_to_back, "glyphicon-arrow-left")
    buttons << table_button(url_to_new, "glyphicon-plus") if button_to_new
    content_tag(:div, class: "panel panel-default") do
      content_tag(:div, class: "panel-heading panel-dark") do
        content_tag(:span, title, class: "panel-title title-weight title-grey") +
        content_tag(:div, class: "pull-right") do
          content_tag(:div, raw(buttons), class: "btn-group")
        end
      end + content_tag(:div, class: "panel-body") { yield }
    end
  end

  def show_table_button(url)
    link_to url, class: "btn btn-default btn-xs" do
      content_tag(:span, nil, class: "glyphicon glyphicon-eye-open")
    end
  end

  def edit_table_button(url)
    link_to url, class: "btn btn-default btn-xs" do
      content_tag(:span, nil, class: "glyphicon glyphicon-pencil")
    end
  end

  def destroy_table_button(url)
    link_to url, class: "btn btn-default btn-xs", method: :delete,
      data: { confirm: '¿Estas seguro?' } do
        content_tag(:span, nil, class: "glyphicon glyphicon-trash")
    end
  end

  def check_string(string)
    string.present? ? string : content_tag(:span, "no suministro", class: "text-danger")
  end
  alias :cs :check_string

  def mssg_for_empty_table(mssg = "No hay datos registrados.")
    content_tag(:div, mssg, class: "mssg-empty-table")
  end


  def apply_colors
    cycle("rojo", "naranja", "amarillo", "verde", "celeste", "azul", "fucsia", "morado")
  end

  def flag(team)
    name = team.abbr.downcase.gsub(" ","_")
    image_tag "flags/33x22_#{name}.png"
  end

  def big_flag(team)
    name = team.abbr.downcase.gsub(" ","_")
    image_tag "flags/50x33_#{name}.png"
  end

  def position_in_classification(table, user_name)
    table.each_with_index do |(name, point), index|
      return (index + 1) if user_name == name
    end
  end

  private
    def table_button(url, icon)
      link_to url, class: "btn btn-default btn-xs" do
        content_tag(:span, nil, class: "glyphicon #{icon}")
      end
    end
end
