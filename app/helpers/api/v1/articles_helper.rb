# frozen_string_literal: true

# helper mixin implementation (ruby on rails design pattern)
# + adds functionality to classes without need of inheritance complexity
# + modules can be included as instance methods in classes or be extended as class methods
# + modules can be "mixed in" to a class -> dont need instantiiation
module Api
  module V1
    module ArticlesHelper
      # mixin
      def parse_and_validate_json_request
        JSON.parse(request.body.read)
        request.body.rewind
      rescue JSON::ParserError => e
        render json: { error: "Malformed JSON: #{e.message}" }, status: :bad_request
      end
    end
  end
end
