# frozen_string_literal: true

# @api public
# @since 0.1.0
class SmartCore::Operation::Result::Callback < SmartCore::Operation::Result::Basic
  # @return [NilClass]
  #
  # @api private
  # @since 0.1.0
  EMPTY_INVOKATION_CONTEXT = nil

  # @return [Proc]
  #
  # @api public
  # @since 0.1.0
  alias_method :callback, :__result_block__
  public :callback

  # @param context [Any]
  # @return [Any]
  #
  # @api public
  # @since 0.1.0
  def call(context = EMPTY_INVOKATION_CONTEXT)
    context == EMPTY_INVOKATION_CONTEXT ? callback.call : context.instance_eval(&callback)
  end

  # @return [Boolean]
  #
  # @api public
  # @since 0.1.0
  def callback?
    true
  end
end
