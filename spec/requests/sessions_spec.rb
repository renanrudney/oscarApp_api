require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "POST /auth (login)" do
    it "returns 200 if valid credentials is provided" do
      user = create(:user)
      token = create(:token, user: user)
      post "/auth", params: { login: user.login, password: user.password }

      expect(response).to have_http_status(200)

      data = JSON.parse(response.body, symbolize_names: true)
      expect(data[:token]).to eq(token.token_number)
    end

    it "returns 401 if invalid credentials is provided" do
      post "/auth", params: { login: Faker::Internet.username, password: Faker::Internet.password}

      expect(response).to have_http_status(401)

      data = JSON.parse(response.body, symbolize_names: true)
      expect(data[:error]).to be_truthy
    end
  end
end
