# frozen_string_literal: true

# decorator implementation (ruby on rails design pattern)
# + allows to offload presentation logic from models
# + extends an article object with functions while preserving its original behaviour
class ArticleDecorator
  attr_reader :article

  def initialize(article)
    @article = article
  end

  def upcased_title
    article.title.upcase
  end

  def short_body
    article.body.truncate(100)
  end

  def formatted_date
    article.created_at.strftime('%A, %d %b %Y %I:%M %p')
  end
end
