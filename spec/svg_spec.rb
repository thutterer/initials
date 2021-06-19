RSpec.describe Initials::SVG do
  subject(:rick) { described_class.new("Rick Sanchez", **options) }
  let(:morty) { described_class.new("Morty Smith") }
  let(:birdperson) { described_class.new("Birdperson") }
  let(:options) { {} }

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
  end

  describe "config options" do
    describe "colors" do
      it "sets number of different hues" do
        colors = []
        50.times do
          colors << described_class.new(rand(99999).to_s, colors: 3).fill
        end
        expect(colors.uniq.length).to be <= 3
      end

      [-1, 0, 7, 16, 720].each do |colors|
        it "validates divisor of 360 (#{colors} is invalid)" do
          expect { described_class.new("Rick", colors: colors) }.to raise_error Initials::Error
        end
      end

      [6, 12, 60, 360].each do |colors|
        it "validates divisor of 360 (#{colors} is valid)" do
          expect { described_class.new("Rick", colors: colors) }.not_to raise_error
        end
      end
    end
    
    describe "limit" do
      let(:options) { {limit: 1} }

      it "defaults to 3" do
        expect(described_class.new("Ants in my Eyes Johnson").initials.length).to eq 3
      end

      it "changes initials max length" do
        expect(subject.initials.length).to eq 1
      end
    end

    describe "size" do
      let(:options) { {size: 512} }

      it "changes SVG height and width" do
        expect(subject.to_s).to match(/^<svg .*height='512'.+<\/svg>/)
        expect(subject.to_s).to match(/^<svg .*width='512'.+<\/svg>/)
      end

      [-1, 0, nil].each do |size|
        it "validates positive integer (#{size} is invalid)" do
          expect { described_class.new("Rick", size: size) }.to raise_error Initials::Error
        end
      end

      [1, 32, 512].each do |size|
        it "validates positive integer (#{size} is valid)" do
          expect { described_class.new("Rick", size: size) }.not_to raise_error
        end
      end
    end
  end
end
