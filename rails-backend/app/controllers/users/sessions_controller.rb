# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    respond_to :json
    skip_before_action :verify_authenticity_token

    private

    # defines how to respond to POST
    def respond_with(current_user, _opts = {})
      render json: {
        status: {
          code: 200, message: 'Logged in successfully.',
          data: current_user
        }
      }, status: :ok
    end

    # defines how to respond to DELETE
    def respond_to_on_destroy
      if request.headers['Authorization'].present?
        jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last,
                                 Rails.application.credentials.devise_jwt_secret_key!).first
        current_user = User.find(jwt_payload['sub'])
      end

      if current_user
        render json: {
          status: 200,
          message: 'Logged out successfully.'
        }, status: :ok
      else
        render json: {
          status: 401,
          message: "Couldn't find an active session."
        }, status: :unauthorized
      end
    end
    # private

    # def respond_with(resource, _opts = {})
    #   render json: { message: "Welcome, you're in", user: current_user }, status: :ok
    # end

    # def respond_to_on_destroy
    #   successful_logout && return if current_user

    #   failed_logout
    # end

    # def successful_logout
    #   render json: { message: "You've logged out" }, status: :ok
    # end

    # def failed_logout
    #   render json: { message: 'Something went wrong.' }, status: :unauthorized
    # end
  end
end
