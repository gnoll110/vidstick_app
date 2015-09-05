require 'rails_helper'

describe ScanSources do
  before :each do
    create(:source, :dwhelper)
    create(:source, :downloads)
  end

  context ".process" do
    it "basic scan" do
      scanner = ScanSources.new
      scanner.process
    end
  end
end