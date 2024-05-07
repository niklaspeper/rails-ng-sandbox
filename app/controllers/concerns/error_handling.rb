# frozen_string_literal: true

# concern that defines custom error handling
module ErrorHandling
  extend ActiveSupport::Concern
  included do
    rescue_from StandardError do |exception|
      respond_to_error(exception)
    end
  end

  private

  def respond_to_error(exception)
    respond_to do |format|
      format.html { render 'error/standard_error', status: :not_found, locals: { exception: } }
      format.json { render json: { error: exception.message }, status: :internal_server_error }
    end
  end
end
