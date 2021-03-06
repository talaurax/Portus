# frozen_string_literal: true

require "rails_helper"

RSpec.describe DashboardController, type: :controller do
  let(:user) { create(:user) }

  before do
    create(:registry)
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "Headers" do
    it "sets the X-UA-Compatible header" do
      get :index
      expect(response.headers["X-UA-Compatible"]).to eq("IE=edge")
    end
  end
end
