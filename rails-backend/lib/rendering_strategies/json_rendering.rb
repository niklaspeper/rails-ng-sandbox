# frozen_string_literal: true

module RenderingStrategies
  module JSONStrategies
    include RenderingStrategy
    def render(article)
      serialized = ArticleSerializer.serialize(article)
      ApplicationController.render(:json, serialized)
    end
  end
end
