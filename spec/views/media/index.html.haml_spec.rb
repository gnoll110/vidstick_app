require 'rails_helper'

RSpec.describe "media/index", type: :view do
  before(:each) do
    assign(:media, [
      Medium.create!(
        :filename => "Filename",
        :modified_filename => "Modified Filename"
      ),
      Medium.create!(
        :filename => "Filename2",
        :modified_filename => "Modified Filename2"
      )
    ])
  end

  it "renders a list of media" do
    render
    assert_select "tr>td", :text => "Filename".to_s, :count => 1
    assert_select "tr>td", :text => "Modified Filename2".to_s, :count => 1
  end
end
