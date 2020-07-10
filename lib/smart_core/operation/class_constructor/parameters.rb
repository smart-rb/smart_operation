# frozen_string_literal: true

# @api private
# @since 0.1.0
class SmartCore::Operation::ClassConstructor::Parameters
  # @return [String, Symbol]
  #
  # @api private
  # @since 0.1.0
  attr_reader :type_system

  # @param type_system [String, Symbol]
  # @return [void]
  #
  # @api private
  # @since 0.1.0
  def initialize(type_system:)
    @type_system = type_system
  end
end
