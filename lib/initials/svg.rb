module Initials
  class SVG
    HUE_WHEEL = 360

    attr_reader :name, :colors, :limit, :shape, :size

    def initialize(name, colors: 12, limit: 3, shape: :circle, size: 32)
      @name = name
      @colors = colors
      @limit = limit
      @shape = shape
      @size = size

      raise Initials::Error.new("Name is not a string or empty.") unless (name.respond_to?(:to_s) && name.to_s.length > 0)
      raise Initials::Error.new("Colors must be a divider of 360 e.g. 24 but not 16.") unless valid_colors?
      raise Initials::Error.new("Size is not a positive integer.") unless valid_size?
    end

    def to_s
      svg = [
        "<svg width='#{size}' height='#{size}'>",
          shape == :rect ?
            "<rect width='#{size}' height='#{size}' rx='#{size / 32}' ry='#{size / 32}' fill='#{fill}' />"
          :
            "<circle cx='#{size / 2}' cy='#{size / 2}' r='#{size / 2}' fill='#{fill}' />",
          "<text x='50%' y='50%' fill='white' fill-opacity='0.75' dominant-baseline='central' text-anchor='middle' style='font-size: #{font_size}px; font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen-Sans, Ubuntu, Cantarell, \"Helvetica Neue\", sans-serif; user-select: none;'>",
            "#{initials}",
          "</text>",
        "</svg>"
      ].join

      svg.html_safe rescue svg
    end

    def fill
      hue_step = HUE_WHEEL / colors
      char_sum = name.split("").sum do |c|
        # Multiplication makes sure neighboring characters (like A and B) are one hue step apart.
        c.ord * hue_step
      end

      # Spin the wheel!
      hue = char_sum % HUE_WHEEL
      
      "hsl(#{hue}, 40%, 40%)"
    end

    def font_size
      size/2 + size/16 - (initials.length * size/16)
    end

    def initials
      name.split(' ')[0, limit].map { |s| s[0].capitalize }.join
    end

    private

    def valid_colors?
      return false unless colors.respond_to?(:to_i)
      return false unless colors > 0
      HUE_WHEEL % colors == 0
    end

    def valid_size?
      return false unless size.respond_to?(:to_i)
      size.to_i > 0
    end
  end
end