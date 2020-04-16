# frozen_string_literal: true

# @api public
# @since 0.1.0
class SmartCore::Operation::Result::ErrorCase
  require_relative 'error_case/code'
  require_relative 'error_case/context'

  # @param code [String, Symbol, Any]
  # @param context [Hash, Any]
  # @return [void]
  #
  # @api private
  # @since 0.1.0
  def initialize(code: Code::EMPTY_CODE, context: Context::EMPTY_CONTEXT)
    @code = Code.build(code)
    @context = Context.build(context)
  end

  # @return [String, Symbol, NilClass, Any]
  #
  # @api public
  # @since 0.1.0
  def code
    code.identifier
  end

  # @return [Hash]
  #
  # @api public
  # @since 0.1.0
  def context
    context.data
  end

  # @return [Hash<Synbol,Any>]
  #
  # @api public
  # @since 0.1.0
  def to_h
    { code: code, context: context }
  end
end
