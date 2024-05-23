# frozen_string_literal: true

# this concern belongs to models because it deals with model-related logic such as validations, scopes and helper
# methods for model instances
# A controller concern on the other hand rather contains logic such as preparing data for views, handling form
# submissions and validations, implementing authorization checks or error handling for rendering methods
module Visible
  # as validations are called at class level and this is a module, this extension is used for simpler implementation of
  # validation
  extend ActiveSupport::Concern

  VALID_STATUSES = %w[public private archived].freeze

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
