require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success) #test for 200 status
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to be_success
    end
  end

  describe "GET #team" do
    it "returns http success" do
      get :team
      expect(response).to be_success
    end
  end

  describe "GET #info" do
    it "redirects to #about" do
      get :info
      expect(response).to redirect_to about_path
    end
  end
end
