# frozen_string_literal: true

# @api private
# @since 0.1.0
class SmartCore::Operation::Result::Basic
  # @param result_arguments [Array<Any>]
  # @param result_callback [Block]
  # @return [void]
  #
  # @api private
  # @since 0.1.0
  def initialize(*result_arguments, &result_callback)
    @__initial_result_arguments__ = result_arguments
    @__result_parameters__, @__result_options__ = __extract_result_attributes__(result_arguments)
    @__result_callback__ = result_callback
  end

  # @return [Boolean]
  #
  # @api public
  # @since 0.1.0
  def success?
    false
  end

  # @return [Boolean]
  #
  # @api public
  # @since 0.1.0
  def failure?
    false
  end

  # @return [Boolean]
  #
  # @api public
  # @since 0.1.0
  def fatal?
    false
  end

  # @return [Boolean]
  #
  # @api public
  # @since 0.1.0
  def callback?
    false
  end

  private


  # @return [Array<Any>]
  #
  # @api private
  # @since 0.1.0
  attr_reader :__initial_result_arguments__

  # @return [Array<Any>]
  #
  # @api private
  # @since 0.1.0
  attr_reader :__result_parameters__

  # @return [Hash<Symbol,Any>]
  #
  # @api private
  # @since 0.1.0
  attr_reader :__result_options__

  # @return [Block]
  #
  # @api private
  # @since 0.1.0
  attr_reader :__result_callback__

  # @param result_arguments [Array<Any>]
  # @return [Array<Array<Any>,Hash<Symbol,Any>>]
  #
  # @api private
  # @since 0.1.0
  def __extract_result_attributes__(result_arguments)
    extracted_parameters = []
    extracted_options = {}

    if (
      result_arguments.last.is_a?(Hash) &&
      result_arguments.last.keys.all? { |key| key.is_a?(Symbol) }
    )
      extracted_parameters = result_arguments[0..-2]
      extracted_options = result_arguments.last
    else
      extracted_parameters = result_arguments
    end

    [extracted_parameters, extracted_options]
  end
end
