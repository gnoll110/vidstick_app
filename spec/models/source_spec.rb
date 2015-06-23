require 'rails_helper'

RSpec.describe Source, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  context "test vilidate" do
    it "dup path" do
      source = Source.create
      source.path = "/home/noel/Downloads"
      source.save
      source = Source.create
      source.path = "/home/noel/Downloads"
      source.save
      expect(Source.count).to eq(1)
    end
  end
end
