require 'rails_helper'

RSpec.describe 'Account Api', type: :request do
  describe 'GET /account' do
    it 'returns a success response: 200' do
      create_list(:account, 3)

      get '/accounts'
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json.size).to eq(3)
    end
  end

  describe 'GET /account/{id}' do
    it 'returns a success response: 200' do
      user = create(:account)

      get "/accounts/#{user.id}"
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json["username"]).to eq(user.username)
    end
  end
end