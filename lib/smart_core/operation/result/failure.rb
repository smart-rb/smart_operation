# frozen_string_literal: true

# @api public
# @since 0.1.0
class SmartCore::Operation::Result::Failure < SmartCore::Operation::Result::Basic
  # @return [Array<Any>] Prefer symbols or strings
  #
  # @api public
  # @since 0.1.0
  alias_method :error_codes, :__result_parameters__
  public :error_codes

  # @return [Hash<Symbol,Any>]
  #
  # @api private
  # @since 0.1.0
  alias_method :error_context, :__result_options__
  public :error_context

  # @return [Boolean]
  #
  # @api public
  # @since 0.1.0
  def failure?
    true
  end
end
