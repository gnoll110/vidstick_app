require 'rails_helper'

RSpec.describe "media/new", type: :view do
  before(:each) do
    assign(:medium, Medium.new(
      :filename => "MyString",
      :modified_filename => "MyString"
    ))
  end

  it "renders new medium form" do
    render

    assert_select "form[action=?][method=?]", media_path, "post" do

      assert_select "input#medium_filename[name=?]", "medium[filename]"

      assert_select "input#medium_modified_filename[name=?]", "medium[modified_filename]"
    end
  end
end
