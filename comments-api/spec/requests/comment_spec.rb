require 'rails_helper'

RSpec.describe 'Comments API', type: :request  do
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
      expect(json.size).to eq(1)
    end
  end
end