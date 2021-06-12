module Initials
  class SVG
    attr_reader :name, :size

    def initialize(name, size: 32)
      @name = name
      @size = size
    end

    def to_s
      svg = [
        "<svg width='#{size}' height='#{size}'>",
          "<circle cx='#{size / 2}' cy='#{size / 2}' r='#{size / 2}' fill='#{fill}' />",
          "<text x='50%' y='50%' fill='white' fill-opacity='0.75' dominant-baseline='central' text-anchor='middle' style='font: bold #{font_size}px sans-serif;'>",
            "#{initials}",
          "</text>",
        "</svg>"
      ].join

      svg.html_safe rescue svg
    end

    def fill
      "#111111" # TODO
    end

    def font_size
      size/2 + size/16 - (initials.length * size/16)
    end

    def initials
      name.split(' ')[0, 3].map { |s| s[0].capitalize }.join
    end
  end
end