require 'rails_helper'

RSpec.describe "destinations/edit", type: :view do
  before(:each) do
    @destination = assign(:destination, Destination.create!(
      :path => "MyString"
    ))
  end

  it "renders the edit destination form" do
    render

    assert_select "form[action=?][method=?]", destination_path(@destination), "post" do

      assert_select "input#destination_path[name=?]", "destination[path]"
    end
  end
end
