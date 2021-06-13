RSpec.describe Initials::SVG do
  subject(:rick) { described_class.new("Rick Sanchez") }
  let(:morty) { described_class.new("Morty Smith") }
  let(:birdperson) { described_class.new("Birdperson") }

  describe "#fill" do
    it "is a color in HSL format" do
      expect(subject.fill).to match /^hsl\(\d+, \d+%, \d+%\)$/
    end

    it "has different hue than with other names" do
      # Note: Currently limited to 360 different hues/colors.
      # Using modulo, so different names can result in identical colors.
      expect(rick.fill).not_to eq morty.fill
    end
  end

  describe "#font_size" do
    it "is a pixel font size as integer" do
      expect(subject.font_size.class).to eq Integer
    end

    it "is based on SVG size" do
      expect(described_class.new("Rick", size: 16)).not_to eq described_class.new("Rick", size: 32).font_size
    end

    it "is based on initials length" do
      expect(rick.font_size).not_to eq birdperson.font_size
    end
  end

  describe "#initials" do
    it "is the initials of given name" do
      expect(rick.initials).to eq "RS"
    end

    it "is never longer than 3 characters" do
      expect(described_class.new("Ants in my Eyes Johnson").initials.length).to eq 3
    end
  end
end
