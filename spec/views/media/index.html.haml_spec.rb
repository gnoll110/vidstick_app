require 'rails_helper'

RSpec.describe "media/index", type: :view do
  before(:each) do
    assign(:media, [
      Medium.create!(
        :filename => "Filename",
        :modified_filename => "Modified Filename"
      ),
      Medium.create!(
        :filename => "Filename",
        :modified_filename => "Modified Filename"
      )
    ])
  end

  it "renders a list of media" do
    render
    assert_select "tr>td", :text => "Filename".to_s, :count => 2
    assert_select "tr>td", :text => "Modified Filename".to_s, :count => 2
  end
end
