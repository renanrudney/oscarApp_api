require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "POST /auth (login)" do
    it "with valid credentials" do
      user = create(:user)
      post "/auth", params: { email: user.email, password: user.password }

      expect(response).to have_http_status(200)

      data = JSON.parse(response.body, symbolize_names: true)
      expect(data[:token]).to be_truthy
    end
  end
end
