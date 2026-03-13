# frozen_string_literal: true

module PeasyCSS
  module_function

  def linear_gradient(colors, direction: "to right")
    "background: linear-gradient(#{direction}, #{colors.join(', ')});"
  end

  def radial_gradient(colors, shape: "circle")
    "background: radial-gradient(#{shape}, #{colors.join(', ')});"
  end

  def conic_gradient(colors, angle: 0)
    "background: conic-gradient(from #{angle}deg, #{colors.join(', ')});"
  end

  def box_shadow(x: 0, y: 4, blur: 6, spread: 0, color: "rgba(0,0,0,0.1)")
    "box-shadow: #{x}px #{y}px #{blur}px #{spread}px #{color};"
  end

  def text_shadow(x: 1, y: 1, blur: 2, color: "rgba(0,0,0,0.3)")
    "text-shadow: #{x}px #{y}px #{blur}px #{color};"
  end

  def border_radius(*radii)
    vals = radii.map { |r| r.is_a?(Numeric) ? "#{r}px" : r.to_s }
    "border-radius: #{vals.join(' ')};"
  end

  def flexbox(direction: "row", justify: "flex-start", align: "stretch", wrap: "nowrap", gap: nil)
    lines = [
      "display: flex",
      "flex-direction: #{direction}",
      "justify-content: #{justify}",
      "align-items: #{align}",
      "flex-wrap: #{wrap}",
    ]
    lines << "gap: #{gap}" if gap
    lines.join(";\n") + ";"
  end

  def grid(columns: 3, gap: "1rem", min_width: nil)
    col = min_width ? "repeat(auto-fit, minmax(#{min_width}, 1fr))" : "repeat(#{columns}, 1fr)"
    "display: grid;\ngrid-template-columns: #{col};\ngap: #{gap};"
  end

  def transform(rotate: nil, scale: nil, translate_x: nil, translate_y: nil)
    parts = []
    parts << "rotate(#{rotate}deg)" if rotate
    parts << "scale(#{scale})" if scale
    parts << "translateX(#{translate_x}px)" if translate_x
    parts << "translateY(#{translate_y}px)" if translate_y
    "transform: #{parts.join(' ')};"
  end

  def transition(property: "all", duration: "0.3s", easing: "ease", delay: nil)
    val = "#{property} #{duration} #{easing}"
    val += " #{delay}" if delay
    "transition: #{val};"
  end
end
