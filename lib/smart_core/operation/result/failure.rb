# frozen_string_literal: true

# @api public
# @since 0.1.0
class SmartCore::Operation::Result::Failure < SmartCore::Operation::Result::Error
  # @yield [SmartCore::Operation::Result::Failure]
  # @return [Boolean]
  #
  # @api public
  # @since 0.1.0
  def failure?
    true.tap { yield(self) if block_given? }
  end
end
