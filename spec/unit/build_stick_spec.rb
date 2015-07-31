require 'rails_helper'

describe BuildStick do
  context ".process" do
    it "basic build" do
      builder = BuildStick.new({"utf8"=>"✓", 
      	"authenticity_token"=>"bL6rSrXlb1lc9hYtdDSEgCdJC9M3o5LoJ40zZ/TRnrsJjZT6sAvOPk+tLrn24D1RuyzMRJ0ZQKEBWeirzVrkCw==",
      	"stick"=>{"destination"=>["", "4", "20", "5"]},
      	"commit"=>"Save Stick", "controller"=>"welcome", "action"=>"builder"})
      builder.process
    end
  end
end
