# frozen_string_literal: true

require 'rails_helper'

# testing
# utilizing rspec as the most popular testing library in rails
# execution cmd: 'bundle exec rspec spec/models/article_spec.rb'
RSpec.describe Article, type: :model do
  # describes the context for what we are testing. in this case we want to test the scopes of the model 'Article'
  context 'scopes' do
    # let keyword is used to globally use variables in between the same context
    let!(:article1) do
      FactoryBot.create(:article)
    end
    let!(:article2) do
      # using the trait :old (1.day.ago) here
      FactoryBot.create(:article, :old)
    end
    let!(:article3) do
      # overriding specific attributes created by factorybot
      FactoryBot.create(:article, created_at: 2.days.ago)
    end
    # it expectation describes the method that is to be tested
    # - unit test
    it '#all_public' do
      public_articles = Article.where(status: 'public')
      expect(Article.all_public).to eq(public_articles)
    end

    # test driven development (programming methodology)
    # this test was written before the actual scope was implemented
    # - unit test
    it '#sort_by_created_at' do
      sort_by_created = [article1, article2, article3]
      expect(Article.sort_by_created_at).to eq(sort_by_created)
    end
  end
end
