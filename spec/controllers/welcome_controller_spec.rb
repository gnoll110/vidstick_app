require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #loader" do
    it "returns http success" do
      get :loader
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #builder" do
    before :each do
      create(:destination, :dev)
      create(:destination, :eco)
      create(:destination, :dev_rails)
    end

    it "returns http success" do
      selector = DefaultSelector.new
      post :builder, { selector: selector, stick: {"destination"=>["", "4", "20", "5"]} }
      expect(response).to have_http_status(:success)
    end
  end

end
