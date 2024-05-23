# frozen_string_literal: true

module RenderingStrategies
  module HTMLRendering
    include RenderingStrategy

    def render(article)
      ApplicationController.render(template: 'articles/show', locals: { article: }, layout: false)
    end
  end
end
