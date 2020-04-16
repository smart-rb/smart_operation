# frozen_string_literal: true

# @api public
# @since 0.1.0
class SmartCore::Operation::Result::ErrorCase::Code
  # @return [NilClass]
  #
  # @api private
  # @since 0.1.0
  EMPTY_CODE = nil

  class << self
    # @param code [String, Symbol, NilClass, Any]
    # @return [SmartCore::Operation::Result::ErrorCase::Code]
    #
    # @api private
    # @since 0.1.0
    def build(code = EMPTY_CODE)
      new(code)
    end
  end

  # @return [String, Symbol, NilClass, Any]
  #
  # @api public
  # @since 0.1.0
  attr_reader :code
  alias_method :identifier, :code

  # @param code [String, Symbol, NilClass, Any]
  # @return [void]
  #
  # @api private
  # @since 0.1.0
  def initialize(code)
    @code = code
  end
end
