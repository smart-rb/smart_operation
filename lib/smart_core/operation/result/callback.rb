# frozen_string_literal: true

# @api public
# @since 0.1.0
class SmartCore::Operation::Result::Callback < SmartCore::Operation::Result::Basic
  # @return [Boolean]
  #
  # @api public
  # @since 0.1.0
  def callback?
    true
  end
end
