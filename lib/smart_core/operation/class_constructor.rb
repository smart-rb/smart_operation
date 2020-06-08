# frozen_string_literal: true

# @api private
# @since 0.1.0
module SmartCore::Operation::ClassConstructor
  require_relative 'class_constructor/parameters'

  # @return [SmartCore::Engine::Lock]
  #
  # @api private
  # @since 0.1.0
  CONSYSTENCY_CONTROL = SmartCore::Engine::Lock.new

  class << self
    # @param klass [Class, Class<SmartCore::Operation>]
    # @option type_system [String, Symbol]
    # @return [Class<SmartCore::Operation>]
    #
    # @api private
    # @since 0.1.0
    def construct(klass = Class.new(SmartCore::Operation), type_system: default_type_system)
      klass.tap do
        consistent do
          parameters = Parameters.new(type_system: type_system)
          inject_initializer_interface(klass, parameters)
        end
      end
    end

    # @return [String, Symbol]
    #
    # @api private
    # @since 0.1.0
    def default_type_system
      SmartCore::Initializer::Configuration[:default_type_system]
    end

    private

    # @param klass [Class, Class<SmartCore::Operation>]
    # @param parameters [SmartCore::Operation::ClassConstructor::Parameters]
    # @return [void]
    #
    # @api private
    # @since 0.1.0
    def inject_initializer_interface(klass, parameters)
      unless klass < SmartCore::Initializer
        klass.include(SmartCore::Initializer(type_system: parameters.type_system))
      end
    end

    # @param block [Block]
    # @return [Any]
    #
    # @api private
    # @since 0.1.0
    def consistent(&block)
      CONSYSTENCY_CONTROL.synchronize(&block)
    end
  end
end
