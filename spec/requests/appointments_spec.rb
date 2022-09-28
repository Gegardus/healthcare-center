require 'rails_helper'

RSpec.describe "Appointments", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/appointments/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/appointments/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/appointments/show"
      expect(response).to have_http_status(:success)
    end
  end

end
