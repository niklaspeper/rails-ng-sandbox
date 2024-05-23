# frozen_string_literal: true

# factory methods implementation (ruby on rails design pattern)
# + statelessness
# + SRP (single responsibility principle)
# + ease of access and use
# + flexibility
module Factories
  class ArticleFactory
    def self.create_public(attributes = {})
      attributes.merge!(status: :public)
      Article.create!(attributes)
    end

    def self.create_private(attributes = {})
      attributes.merge!(status: :private)
      Article.create!(attributes)
    end

    def self.create_archived(attributes = {})
      attributes.merge!(status: :archived)
      Article.create!(attributes)
    end
  end
end
