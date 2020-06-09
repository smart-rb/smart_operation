# frozen_string_literal: true

# @api private
# @since 0.1.0
class SmartCore::Operation::Result::Error < SmartCore::Operation::Result::Basic
  require_relative 'error/code'
  require_relative 'error/context'
  require_relative 'error/case'
  require_relative 'error/set'

  # @return [SmartCore::Operation::Result::Error::Set]
  #
  # @api public
  # @since 0.1.0
  attr_reader :errors

  # @yield [SmartCore::Operation::Result::Error]
  # @return [Boolean]
  #
  # @api public
  # @since 0.1.0
  def error?
    true.tap { yield(self) if block_given? }
  end

  # @return [Array<String|Symbol|Any>]
  #
  # @api public
  # @since 0.1.0
  def error_codes
    errors.codes
  end

  # @return [Hash<String|Symbol,Any>]
  #
  # @api public
  # @since 0.1.0
  def error_context
    errors.context
  end

  # @return [void]
  #
  # @api public
  # @since 0.1.0
  def each_error(&block)
    errors.each(&block)
  end

  private

  # @return [void]
  #
  # @api private
  # @since 0.1.0
  def __after_initialize__
    @errors = SmartCore::Operation::Result::Error::Set.build(
      __result_parameters__,
      __result_options__
    )
  end
end
