require 'rails_helper'

RSpec.describe Medium, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  context "test vilidate" do
    it "dup path" do
      medium = Medium.create
      medium.filename = "rails.mp4"
      medium.save
      medium = Medium.create
      medium.filename = "rails.mp4"
      medium.save
      expect(Medium.count).to eq(1)
      expect(medium.errors.full_messages).to eq(['Filename has already been taken'])
    end

    it "filename too short" do
      medium = Medium.create
      medium.filename = "d"
      medium.save
      expect(Medium.count).to eq(0)
      expect(medium.errors.full_messages).to eq(['Filename is too short (minimum is 2 characters)'])
    end
  end
end
