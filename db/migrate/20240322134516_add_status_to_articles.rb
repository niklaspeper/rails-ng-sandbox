# frozen_string_literal: true

# AddStatusToArticles migration
#
# Adds a `status` column to the `articles` table.
# The status is used to determine the visibility of an article.
class AddStatusToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :status, :string, default: 'public'
  end
end
