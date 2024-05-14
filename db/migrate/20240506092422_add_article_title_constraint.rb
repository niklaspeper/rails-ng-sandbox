# frozen_string_literal: true

class AddArticleTitleConstraint < ActiveRecord::Migration[7.1]
  def change
    change_column :articles, :title, :string, null: false
    add_index :articles, :title, unique: true
  end
end
