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
      expect(source.errors.full_messages).to eq(['Path has already been taken'])
    end

    it "too short path" do
      source = Source.create
      source.path = "d"
      source.save
      expect(Source.count).to eq(0)
      expect(source.errors.full_messages).to eq(['Path is too short (minimum is 2 characters)'])
    end
  end
end
