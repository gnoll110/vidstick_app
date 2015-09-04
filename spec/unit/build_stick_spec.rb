require 'rails_helper'

describe BuildStick do
  before :each do
    create(:destination, :dev)
    create(:destination, :eco)
    create(:destination, :dev_rails)
  end

  context ".process" do
    it "basic build" do
      builder = BuildStick.new({"destination"=>["", "4", "20", "5"]})
      builder.process
    end
  end
end
