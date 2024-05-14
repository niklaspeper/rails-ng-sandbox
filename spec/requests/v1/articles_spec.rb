# frozen_string_literal: true

require 'rails_helper'

# integration test
RSpec.describe 'Articles API', type: :request do
  describe 'GET /api/v1/articles/:id' do
    # wraps behaviour that runs before tests
    before do
      # allow_any_instance_of(Api::V1::ArticlesController).to receive(:authenticate).and_return(true)
    end
    let!(:article) { FactoryBot.create(:article) }
    let!(:endpoint) { "/api/v1/articles/#{article.id}" }
    it 'returns the requested article' do
      # make a get request to the show action
      get endpoint
      # expect a successful response status(http 200 ok)
      expect(response).to have_http_status(:ok)
      # parse json response body
      json_response = JSON.parse(response.body)
      # validate the content of the response matches the created wikipost
      expect(json_response['id']).to(eq(article.id))
      expect(json_response['title']).to(eq(article.title))
      expect(json_response['body']).to(eq(article.body))
      expect(json_response['status']).to(eq(article.status))
    end
  end
end
