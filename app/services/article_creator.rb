# frozen_string_literal: true

# method object implementation for a more slim controller
# method is too large to keep in controller, therefore encapsulated into an object
class ArticleCreator
  include Factories

  def initialize(article_params)
    @article_params = article_params
  end

  def create
    # retrieves and deletes article param 'status'
    article_status = @article_params.delete(:status)

    case article_status
    when 'public'
      ArticleFactory.create_public(@article_params)
    when 'private'
      ArticleFactory.create_private(@article_params)
    when 'archived'
      ArticleFactory.create_archived(@article_params)
    end
  end
end
