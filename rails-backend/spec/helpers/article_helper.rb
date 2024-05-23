# frozen_string_literal: true

# helper implementation
# very basic example of a helper
# + encapsulate functionality for tests that is used oftenly
module ArticleHelper
  def self.create_article(attrs = {})
    Article.create!(attrs)
  end
end
