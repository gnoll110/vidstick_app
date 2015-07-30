require 'rails_helper'

describe BuildStick do
  context ".process" do
    it "basic build" do
      builder = BuildStick.new(ggg)
      builder.process
    end
  end
end
