require 'rails_helper'

RSpec.describe "media/edit", type: :view do
  before(:each) do
    @medium = assign(:medium, Medium.create!(
      :filename => "MyString",
      :modified_filename => "MyString"
    ))
  end

  it "renders the edit medium form" do
    render

    assert_select "form[action=?][method=?]", medium_path(@medium), "post" do

      assert_select "input#medium_filename[name=?]", "medium[filename]"

      assert_select "input#medium_modified_filename[name=?]", "medium[modified_filename]"
    end
  end
end
