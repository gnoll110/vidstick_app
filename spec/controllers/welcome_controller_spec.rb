require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe do
    before :each do
      create(:destination, :dev)
      create(:destination, :eco) 
      create(:destination, :dev_rails)
    end

    context "GET #loader" do
      it "returns http success" do
        get :loader
        expect(response).to have_http_status(:success)
      end
    end

    context "GET #random_builder" do
      it "returns http success" do
        get :random_builder
        expect(response).to have_http_status(:success)
      end
    end

    context "GET #unclassified_builder" do
      it "returns http success" do
        get :unclassified_builder
        expect(response).to have_http_status(:success)
      end
    end

    context "POST #builder" do
      it "returns http success" do
        selector = DefaultSelector.new({"destination"=>["", "4", "20", "5"]})
        post :builder, stick: {"destination"=>["", "4", "20", "5"]}
        expect(response).to have_http_status(:success)
      end
    end
  end
end
