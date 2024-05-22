# frozen_string_literal: true

class Article < ApplicationRecord
  # include "visible" concern as a module
  include Visible

  # 1 to n relationship
  # enables instance variables such as @article to access belonging comments using "@article.comments"
  # dependent option used to destroy also associated objects such as comments on destroy of an article
  has_many :comments, dependent: :destroy
  belongs_to :user
  # attributes like :title and :body are automatically generated by rails for every database table column
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: { minimum: 10 }

  # scopes as lambda implementation (ruby on rails design pattern)
  # + can be called from controller as "Article.search(keyword)"
  # + scope passes a ruby block
  # + scopes combined with forms can be very useful for specific and efficient queries
  scope :search, ->(keyword) { where('title LIKE ?', "%#{keyword}%") if keyword.present? }
  scope :all_public, -> { where(status: :public) }
  scope :sort_by_created_at, -> { order(created_at: :desc) }
  scope :non_archived, -> { where.not(status: :archived) }
end
