require "chefdist"

describe Chefdist::Packager do
  it "creates a distribution" do
    packager = Chefdist::Packager.new("tmp")
    # packager.dist("outfile.tgz").should eql("outfile.tgz")
  end
end
