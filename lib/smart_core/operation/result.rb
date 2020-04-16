# frozen_string_literal: true

# @api private
# @since 0.1.0
module SmartCore::Operation::Result
  require_relative 'result/error_case'
  require_relative 'result/basic'
  require_relative 'result/success'
  require_relative 'result/failure'
  require_relative 'result/fatal'
  require_relative 'result/callback'
end
