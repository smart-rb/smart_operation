# frozen_string_literal: true

# @api private
# @since 0.1.0
class SmartCore::Operation::InstanceBuilder
  class << self
    # @param operation [SmartCore::Operation]
    # @return [void]
    #
    # @api private
    # @since 0.1.0
    def call(operation)
      new(operation).call
    end
  end

  # @param operation [SmartCore::Operation]
  # @return [void]
  #
  # @api private
  # @since 0.1.0
  def initialize(operation)
    @operation = operation
  end

  # @return [void]
  #
  # @api private
  # @since 0.1.0
  def call
    make_operation_caller_yieldable
  end

  private

  # @return [SmartCore::Operation]
  #
  # @api private
  # @since 0.1.0
  attr_reader :operation

  # @return [void]
  #
  # @api private
  # @since 0.1.0
  def make_operation_caller_yieldable
    operation.singleton_class.prepend(Module.new do
      def call
        super.tap { |result| yield(result) if block_given? }
      rescue SmartCore::Operation::Result::Fatal::FatalError => error
        # NOTE: returns SmartCore::Operation::Result::Fatal instance
        error.__operation_result__.tap { |result| yield(result) if block_given? }
      end
    end)
  end
end
