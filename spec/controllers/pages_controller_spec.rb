require 'rails_helper'


RSpec.describe PagesController, type: :controller do
  include Devise::TestHelpers

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

    it "returns all the right pages" do
      get :index
      expect(assigns(:pages)).to(eq(['about', 'team']))
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

  describe "GET #investor_info" do
    context "with a logged out visitor" do
      it "redirects them to the login page" do
        get :investor_info
        expect(response).to be_redirect
      end
    end

    context "logged in user" do

      before do
        @user = User.create password: '12345678', email: 'jraines@gmail.com'
      end

      it "should be a success" do
        sign_in @user
        get :investor_info
        expect(response).to have_http_status(:success) #test for 200 status
      end
    end
  end

  describe "GET #info" do
    it "redirects to #about" do
      get :info
      expect(response).to redirect_to about_path
    end
  end
end
