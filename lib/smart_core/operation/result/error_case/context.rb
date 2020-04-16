# frozen_string_literal: true

# @api public
# @since 0.1.0
class SmartCore::Operation::Result::ErrorCase::Contex
  # @return [Hash]
  #
  # @api private
  # @since 0.1.0
  EMPTY_CONTEXT = {}.freeze

  # @return [Hash, Any]
  #
  # @api private
  # @since 0.1.0
  attr_reader :context

  # @param context [Hash, Any]
  # @return [void]
  #
  # @api private
  # @since 0.1.0
  def intialize(context = EMPTY_CONTEXT.dup)
    @context = context
  end

  # @retunr [Hash]
  #
  # @api public
  # @since 0.1.0
  def to_h
    context.to_h
  end
  alias_method :data, :to_h
end
