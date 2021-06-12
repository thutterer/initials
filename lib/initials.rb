require "initials/version"

module Initials
  class Error < StandardError; end

  def self.svg(name)
    [
      "<svg width='32' height='32'>",
        "<circle cx='16' cy='16' r='16' fill='#{fill}' />",
        "<text x='50%' y='50%' fill='white' fill-opacity='0.75' dominant-baseline='middle' text-anchor='middle' style='font: bold #{font_size}px sans-serif;'>",
          "#{initials(name)}",
        "</text>",
      "</svg>"
    ].join.html_safe
  end

  def self.fill
    "#333333" # TODO
  end

  def self.font_size
    14 # TODO
  end

  def self.initials(name)
    name.split(' ')[0, 3].map { |s| s[0].capitalize }.join
  end
end
