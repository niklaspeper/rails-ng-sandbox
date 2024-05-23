# frozen_string_literal: true

# AddStatusToComments migration
#
# Adds a `status` column to the `comments` table.
# The status is used to determine the visibility of a comment.
class AddStatusToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :status, :string, default: 'public'
  end
end
