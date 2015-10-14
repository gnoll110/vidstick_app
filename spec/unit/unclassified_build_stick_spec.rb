require 'rails_helper'

describe BuildStick do
  before :each do
    create(:source, :dwhelper)
    create(:source, :downloads)
    create(:destination, :dev)
    create(:destination, :eco)
    create(:destination, :dev_rails)
    create(:medium, :patterns)
    create(:medium, :permaculture)
    create(:medium, :hexagonal)
    create(:medium, :ketosis)
    create(:relation, :dev_patterns)
    create(:relation, :eco_permaculture)
    create(:relation, :dev_rails_hexagonal)
  end

  context ".process" do
    it "unclassified build" do
      selector = UnclassifiedSelector.new
      builder = BuildStick.new({selector: selector})
      builder.process
    end
  end
end
