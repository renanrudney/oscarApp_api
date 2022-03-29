require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "POST /auth (login)" do
    it "returns 200 if valid credentials is provided" do
      user = create(:user)
      post "/auth", params: { email: user.email, password: user.password }

      expect(response).to have_http_status(200)

      data = JSON.parse(response.body, symbolize_names: true)
      expect(data[:token]).to be_truthy
    end

    it "returns 403 if invalid credentials is provided" do
      post "/auth", params: { email: Faker::Internet.email, password: Faker::Internet.password}

      expect(response).to have_http_status(403)

      data = JSON.parse(response.body, symbolize_names: true)
      expect(data[:error]).to be_truthy
    end
  end
end
