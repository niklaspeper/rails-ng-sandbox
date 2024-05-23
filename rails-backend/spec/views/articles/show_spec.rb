# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Article Show', type: :feature do
  context 'crud operations' do
    context 'delete' do
      it 'deletes an article from the show page' do
        # create a test record with factorybot
        article = FactoryBot.create(:article)
        # visit the show page of the record
        visit article_path(article)
        # verify the record's attributes are displayed
        expect(page).to have_link('Edit')
        # click the delete button
        click_link('Destroy')
        expect(Article.count).to eq(0)
        # verify we are redirected after deletion
        expect(current_path).to eq(root_path)
      end
    end
    context 'edit' do
      it 'edits an article from the show page' do
        article = FactoryBot.create(:article)
        title = 'Paul Bunyans Flowers'

        visit article_path(article)
        click_link('Edit')

        fill_in 'Titel', with: title
        click_button 'Article speichern'

        expect(current_path).to eq(article_path(article))
      end
    end
  end
end
