# frozen_string_literal: true

require 'rails_helper'

# unit test
RSpec.describe ArticleSerializer do
  describe '#serialize' do
    let!(:title) { 'test' }
    let!(:body) { 'test' }
    it 'correctly serializes the Article object' do
      article = ArticleHelper.create_article(title:, body:)
      expected_result = { id: article.id,
                          title: article.title,
                          body: article.body,
                          created_at: article.created_at.strftime('%a %d %b %Y'),
                          updated_at: article.updated_at.strftime('%a %d %b %Y'),
                          status: article.status }
      expect(ArticleSerializer.serialize(article)).to eq(expected_result)
    end
  end
end
