# frozen_string_literal: true

# @api public
# @since 0.1.0
class SmartCore::Operation::Result::Fatal < SmartCore::Operation::Result::Error
  # @api private
  # @since 0.1.0
  class FatalError < SmartCore::Operation::Error
    # @return [SmartCore::Operation::Result::Fatal]
    #
    # @api private
    # @since 0.1.0
    attr_reader :__operation_result__

    # @param operation_result [SmartCore::Operation::Result::Fatal]
    # @return [void]
    #
    # @api private
    # @since 0.1.0
    def initialize(operation_result)
      @__operation_result__ = operation_result
    end
  end

  # @retrun [Smart::Operation::Result::Fatal::FatalError]
  #
  # @api private
  # @since 0.1.0
  def exception
    FatalError.new(self)
  end

  # @yield [SmartCore::Operation::Result::Fatal]
  # @return [Boolean]
  #
  # @api public
  # @since 0.1.0
  def fatal?
    true.tap { yield(self) if block_given? }
  end
end
