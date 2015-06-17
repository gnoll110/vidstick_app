require 'rails_helper'

RSpec.describe "media/show", type: :view do
  before(:each) do
    @medium = assign(:medium, Medium.create!(
      :filename => "Filename",
      :modified_filename => "Modified Filename"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Filename/)
    expect(rendered).to match(/Modified Filename/)
  end
end
