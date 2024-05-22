# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # include ErrorHandling
  add_flash_types :error, :success
end
