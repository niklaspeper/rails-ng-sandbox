class Article < ApplicationRecord
  # include "visible" concern as a module
  include Visible

  # 1 to n relationship
  # enables instance variables such as @article to access belonging comments using "@article.comments"
  # dependent option used to destroy also associated objects such as comments on destroy of an article
  has_many :comments, dependent: :destroy
  # attributes like :title and :body are automatically generated by rails for every database table column
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

end
