# frozen_string_literal: true

module Api
  module V2
    class ArticlesController < ApplicationController
      def index
        render json: { 'message': 'under construction' }
      end

      def show
        article = Article.find(params[:id])
        # using a decorator for specific formatting (ruby on rails design pattern)
        decorated_article = ArticleDecorator.new(article)
        render json: {
          upcased_title: decorated_article.upcased_title,
          short_body: decorated_article.short_body,
          formatted_date: decorated_article.formatted_date
        }
      end
    end
  end
end
