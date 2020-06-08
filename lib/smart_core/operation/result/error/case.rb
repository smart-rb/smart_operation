# frozen_string_literal: true

# @api public
# @since 0.1.0
class SmartCore::Operation::Result::Error::Case
  # @param code [String, Symbol, Any]
  # @param context [Hash, Any]
  # @return [void]
  #
  # @api private
  # @since 0.1.0
  def initialize(
    code: SmartCore::Operation::Result::Error::Code::EMPTY_CODE,
    context: SmartCore::Operation::Result::Error::Context::EMPTY_CONTEXT
  )
    @code = SmartCore::Operation::Result::Error::Code.new(code)
    @context = SmartCore::Operation::Result::Error::Context.new(context)
  end

  # @return [String, Symbol, NilClass, Any]
  #
  # @api public
  # @since 0.1.0
  def code
    @code.identifier
  end

  # @return [Hash]
  #
  # @api public
  # @since 0.1.0
  def context
    @context.data
  end

  # @return [Hash<Synbol,Any>]
  #
  # @api public
  # @since 0.1.0
  def to_h
    { code: code, context: context }
  end
end
