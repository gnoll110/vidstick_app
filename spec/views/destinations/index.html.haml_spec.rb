require 'rails_helper'

RSpec.describe "destinations/index", type: :view do
  before(:each) do
    assign(:destinations, [
      Destination.create!(
        :path => "Path"
      ),
      Destination.create!(
        :path => "Path2"
      )
    ])
  end

  it "renders a list of destinations" do
    render
    assert_select "tr>td", :text => "Path".to_s, :count => 1
    assert_select "tr>td", :text => "Path2".to_s, :count => 1
  end
end
