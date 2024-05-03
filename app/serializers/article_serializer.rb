# frozen_string_literal: true

# custom serializer for article model
class ArticleSerializer
  attr_accessor :article

  def initialize(article)
    @article = article
  end

  def self.serialize(article)
    {
      id: article.id,
      created_at: article.created_at.strftime('%a %d %b %Y'),
      updated_at: article.updated_at.strftime('%a %d %b %Y'),
      title: article.title,
      body: article.body,
      status: article.status
    }
  end
end
