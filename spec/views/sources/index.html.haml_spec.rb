require 'rails_helper'

RSpec.describe "sources/index", type: :view do
  before(:each) do
    assign(:sources, [
      Source.create!(
        :path => "Path",
      ),
      Source.create!(
        :path => "Path",
      )
    ])
  end

  it "renders a list of sources" do
    render
    assert_select "tr>td", :text => "Path".to_s, :count => 2
  end
end
