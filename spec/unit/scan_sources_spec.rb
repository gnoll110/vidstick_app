require 'rails_helper'

describe ScanSources do
  context ".process" do
    it "basic scan" do
      scanner = ScanSources.new
      scanner.process
    end
  end
end