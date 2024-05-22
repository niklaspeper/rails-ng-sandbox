# frozen_string_literal: true

module Api
  module V1
    class ArticlesController < ApplicationController
      # mixin from helper made available in controller
      include Api::V1::ArticlesHelper
      require 'csv'

      before_action :parse_and_validate_json_request, only: [:create]
      # before_action :authenticate_user!
      skip_before_action :verify_authenticity_token

      def index
        @articles = Article.all
        render json: @articles
      end

      def show
        @article = Article.find(params[:id])
        # render json: @article
        # here goes custom serialization instead of default rails json rendering
        serialized = ArticleSerializer.serialize(@article)
        render json: serialized
      end

      def create
        @article = Article.new(article_params)
        if @article.save
          render json: @article, status: :created
        else
          render json: @article.errors, status: :unprocessable_entity
        end
      end

      def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
          render json: @article
        else
          render json: @article.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @article = Article.find(params[:id])
        @article.destroy
        head :no_content
      end

      def xml_index
        @articles = Article.all
        render xml: @articles
      end

      def csv_index
        @articles = Article.all
        csv_data = CSV.generate do |csv|
          csv << %w[ID Title Body Status]
          @articles.each do |article|
            csv << [article.id, article.title, article.body, article.status]
          end
        end
        send_data csv_data, filename: 'articles.csv', type: 'text/csv'
      end

      private

      def article_params
        params.permit(:title, :body, :status, :comments)
      end
    end
  end
end
