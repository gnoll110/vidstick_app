require 'rails_helper'

RSpec.describe Destination, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  context "test vilidate" do
    it "dup path" do
      dest = Destination.create
      dest.path = "dev/ruby"
      dest.save
      dest = Destination.create
      dest.path = "dev/ruby"
      dest.save
      expect(Destination.count).to eq(1)
      expect(dest.errors.full_messages).to eq(['Path has already been taken'])
    end
  end
end
