RSpec.describe Initials do
  it "has a version number" do
    expect(Initials::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(Initials.svg("Thomas Hutterer")).to match(/^<svg .*TH<\/text><\/svg>/)
  end
end
