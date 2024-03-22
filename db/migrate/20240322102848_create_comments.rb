class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      # references is a special data type for models.
      # Creates a new column on the db with provided model name appended with an _id (article_id) that can hold integer values.
      # article_id contains an index and a foreign key constraint that points to the id column of articles table
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
