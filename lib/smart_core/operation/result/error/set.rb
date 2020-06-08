# frozen_string_literal: true

# @api private
# @since 0.1.0
class SmartCore::Operation::Result::Error::Set
  # @since 0.1.0
  include Enumerable

  class << self
    # @param error_codes [Array<String, Symbol, Any>]
    # @param error_context [Hash<String|Symbol,Any>]
    # @return [SmartCore::Operation::Result::Error::Set]
    #
    # @api private
    # @since 0.1.0
    def build(error_codes, error_context)
      error_cases =
        if error_codes.empty?
          [SmartCore::Operation::Result::Error::Case.new(context: error_context)]
        else
          error_codes.map do |error_code|
            SmartCore::Operation::Result::Error::Case.new(
              code: error_code,
              context: error_context
            )
          end
        end

      new(error_cases)
    end
  end

  # @return [Array<SmartCore::Operation::Result::Error::Case>]
  #
  # @api private
  # @since 0.1.0
  attr_reader :cases

  # @param cases [Array<SmartCore::Operation::Result::Error::Case>]
  # @return [void]
  #
  # @api private
  # @since 0.1.0
  def initialize(cases)
    @cases = cases.freeze
  end

  # @return [Array<String|Symbol|Any>]
  #
  # @api public
  # @since 0.1.0
  def codes
    cases.map(&:code)
  end

  # @return [Hash<String|Symbol,Any>]
  #
  # @api public
  # @since 0.1.0
  def context
    cases.sample.context
  end

  # @return [void]
  #
  # @api public
  # @sicne 0.1.0
  def each(&block)
    cases.each(&block)
  end
end
