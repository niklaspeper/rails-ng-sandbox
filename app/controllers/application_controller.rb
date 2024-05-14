# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # include ErrorHandling
  around_action :switch_locale
  add_flash_types :error, :success

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  # Every helper method dependent on url_for (e.g. helpers for named routes like root_path or root_url,
  # resource routes like books_path or books_url, etc.) will now automatically include the locale in
  # the query string, like this: http://localhost:3001/?locale=ja.
  def default_url_options
    { locale: I18n.locale }
  end
end
