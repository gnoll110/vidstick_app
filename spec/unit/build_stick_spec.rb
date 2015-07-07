require 'rails_helper'

describe BuildStick do
  context ".process" do
    it "basic build" do
      builder = BuildStick.new
      builder.process
    end
  end
end
