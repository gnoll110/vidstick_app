require 'rails_helper'

RSpec.describe "destinations/show", type: :view do
  before(:each) do
    @destination = assign(:destination, Destination.create!(
      :path => "Path"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Path/)
  end
end
