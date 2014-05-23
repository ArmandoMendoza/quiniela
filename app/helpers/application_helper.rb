module ApplicationHelper
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
end
