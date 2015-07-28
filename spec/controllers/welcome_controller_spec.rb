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
    it "returns http success" do
      post :builder
      expect(response).to have_http_status(:success)
    end
  end

end
