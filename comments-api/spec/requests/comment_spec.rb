require 'rails_helper'

RSpec.describe "Comments API", type: :request do
  describe 'GET /comments' do
    it 'returns a success response: 200' do
      create_list(:comment, 3)

      get '/comments'

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json.size).to eq(3)
    end
  end

  describe 'GET /comments/:id' do
    it 'returns a success response: 200' do
      comment = create(:comment)

      get "/comments/#{comment.id}"

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json[0]['id']).to eq(comment.id)
    end
  end

  describe 'POST /comments' do
    it 'returns a success response: 201' do
      account = create(:account)
      comment_attributes = attributes_for(:comment)

      post '/comments', params: { comment: comment_attributes.merge(account_id: account.id) }

      expect(response).to have_http_status(:created)
    end

    it 'returns a not found response: 404' do
      comment_attributes = attributes_for(:comment)

      post '/comments', params: { comment: comment_attributes.merge(account_id: 1) }
      expect(response).to have_http_status(:not_found)
    end
  end
end
