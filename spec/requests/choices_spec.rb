require 'rails_helper'

RSpec.describe "Choices", type: :request do
  describe "POST /choices" do
    let(:user) { create(:user) }
    let(:token) { create(:token, user: user) }
    let(:remote_movie_id) { rand(1..10) }
    let(:remote_director_id) { rand(1..10) }
    let(:headers) {{ login: user.login, token: token.token_number }}
    let(:params) {{ choice: { remote_movie_id: remote_movie_id, remote_director_id: remote_director_id }}}

    it "returns 200 if valid choices is provided" do
      post "/choices", headers: headers, params: params

      expect(response).to have_http_status(200)

      data = JSON.parse(response.body, symbolize_names: true)
      expect(data[:choice][:remote_director_id]).to eq(remote_director_id)
      expect(data[:choice][:remote_movie_id]).to eq(remote_movie_id)
    end

    it "returns 422 if choice already exists" do
        create(:choice, user: user)
        post "/choices", headers: headers, params: params
  
        expect(response).to have_http_status(422)
  
        data = JSON.parse(response.body, symbolize_names: true)
        expect(data[:error]).to be_truthy
    end

    it "returns 422 if no params is provided" do
        post "/choices", headers: headers
  
        expect(response).to have_http_status(422)
  
        data = JSON.parse(response.body, symbolize_names: true)
        expect(data[:error]).to be_truthy
    end

    it "returns 422 if no choices is provided" do
        post "/choices", headers: headers, params: { choice: {} }
  
        expect(response).to have_http_status(422)
  
        data = JSON.parse(response.body, symbolize_names: true)
        expect(data[:error]).to be_truthy
    end

    it "returns 422 if invalid choices is provided" do
        post "/choices", headers: headers, params: { choice: { remote_movie_id: nil, remote_director_id: nil } }
  
        expect(response).to have_http_status(422)
  
        data = JSON.parse(response.body, symbolize_names: true)
        expect(data[:error]).to be_truthy
    end

    it "returns 401 if invalid credentials is provided" do
      post "/choices", headers: { login: Faker::Internet.username, token: rand(0..100) }, params: params

      expect(response).to have_http_status(401)

      data = JSON.parse(response.body, symbolize_names: true)
      expect(data[:error]).to be_truthy
    end

    it "returns 401 if no credentials is provided" do
        post "/choices", params: params
  
        expect(response).to have_http_status(401)
  
        data = JSON.parse(response.body, symbolize_names: true)
        expect(data[:error]).to be_truthy
      end
  end
end
