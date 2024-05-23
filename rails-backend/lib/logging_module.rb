# frozen_string_literal: true

# custom logging module to make logging more accessible throughout the app
# utilizes different logging methods of Active Support logger
# + simplifies process of logging at different levels and creates convenient methods
# + establishes a standard of logging throughout the app
module LoggingModule
  def log_debug(message)
    # for detailed diagnostic information useful during development and debugging
    Rails.logger.debug(message)
  end

  def log_info(message)
    # logs general information about the application's operation, like successful processes
    Rails.logger.info(message)
  end

  def log_warn(message)
    # captures warnings about potential issues that aren't immediate errors but may require attention
    Rails.logger.warn(message)
  end

  def log_error(message)
    # used for logging errors during application execution, indicating problems that need fixing
    Rails.logger.error(message)
  end

  def log_fatal(message)
    # logs critical issues that could cause the application to terminate, indicating severe problems
    Rails.logger.fatal(message)
  end

  def log_unknown(message)
    # a catch-all for messages that don't fit into other levels, used for unclassified but necessary logs
    Rails.logger.unknown(message)
  end
end
