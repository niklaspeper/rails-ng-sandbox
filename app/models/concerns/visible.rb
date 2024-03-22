module Visible
  # as validations are called at class level and this is a module, this extension is used for simpler implementation of validation
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private', 'archived']

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  # check if article is archived. can be used in views to avoid showing archived articles
  def archived?
    status == 'archived'
  end

  # scope for all instances of a class
  class_methods do
    def public_count
      where(status: 'public').count
    end
  end
end
