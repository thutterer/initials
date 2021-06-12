require "initials/svg"
require "initials/version"

module Initials
  class Error < StandardError; end

  def self.svg(name, **options)
    SVG.new(name, **options).to_s
  end
end
