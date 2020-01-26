# frozen_string_literal: true

# @api public
# @since 0.1.0
class SmartCore::Operation::Result::Success < SmartCore::Operation::Result::Basic
  # @return [Boolean]
  #
  # @api public
  # @since 0.1.0
  def success?
    true
  end
end
