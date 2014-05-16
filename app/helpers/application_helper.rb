module ApplicationHelper
  def apply_colors
    cycle("rojo", "naranja", "amarillo", "verde", "celeste", "azul", "fucsia", "morado")
  end

  def flag(team)
    name = team.name.downcase.gsub(" ","_")
    image_tag "flags/33x22_#{name}.png"
  end

  def big_flag(team)
    name = team.name.downcase.gsub(" ","_")
    image_tag "flags/50x33_#{name}.png"
  end
end
