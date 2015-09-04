require 'rails_helper'

describe BuildStick do
  before :each do
    destination = create :destination, id: "4"
  end

  context ".process" do
    it "basic build" do
      builder = BuildStick.new({"destination"=>["", "4", "20", "5"]})
      builder.process
    end
  end
end
