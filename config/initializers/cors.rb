# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'

    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head],
             #  By default, the rack-cors gem doesn't expose the authorization and UID headers,
             #  but we need them since we'll be passing authorization tokens through.
             expose: %w[Authorization Uid]
  end
end
