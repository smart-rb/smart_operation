# frozen_string_literal: true

# @api public
# @since 0.1.0
class SmartCore::Operation::Result::Fatal < SmartCore::Operation::Result::Basic
  # @return [Boolean]
  #
  # @api public
  # @since 0.1.0
  def fatal?
    true
  end
end
