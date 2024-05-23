# frozen_string_literal: true

require 'rails_helper'

# end-to-end test
# or 'feature test'
RSpec.feature 'Articles', type: :feature do
  let!(:article1) { FactoryBot.create(:article) }
  let!(:article2) { FactoryBot.create(:article) }
  let!(:article3) { FactoryBot.create(:article) }
  let!(:article4) { FactoryBot.create(:article) }

  # retrieve only non archived articles, cause they are not shown on index page
  let!(:articles) { Article.non_archived }

  scenario 'Visiting the Articles page' do
    # capybara method
    visit articles_path
    # from launcher gem: opens a browser tab to see if site is looking when spec is executed
    save_and_open_page

    # Check for the presence of specific elements (capybara methods have_..)
    expect(page).to have_selector('h1', text: 'Artikel')
    expect(page).to have_selector('input', id: 'keyword')

    # Check if @articles data is being displayed correctly
    articles.each do |article|
      expect(page).to have_link(href: /#{article_path(article)}/i)
      expect(page).to have_selector('b', text: article.title)
      expect(page).to have_selector('br')
      expect(page).to have_selector('small', text: article.created_at.strftime('%d.%m.%Y, %H:%M Uhr'))
    end

    # Check for the presence of the "New article" link
    expect(page).to have_link('Neuer Artikel')
  end
end
