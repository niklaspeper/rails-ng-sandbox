# frozen_string_literal: true

# CreateArticles migration
#
# This migration adds a `articles` table to the database.
# It contains a `title` and `body` as columns
class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
