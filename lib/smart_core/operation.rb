# frozen_string_literal: true

require 'smart_core'
require 'smart_core/initializer'

# @api public
# @since 0.1.0
module SmartCore
  # @api public
  # @since 0.1.0
  class Operation
    require_relative 'operation/version'
    require_relative 'operation/errors'
    require_relative 'operation/result'
    require_relative 'operation/interface'
    require_relative 'operation/instance_builder'
    require_relative 'operation/class_constructor'

    class << self
      # @param child_klass [Class]
      # @return [void]
      #
      # @api private
      # @since 0.1.0
      def inherited(child_klass)
        SmartCore::Operation::ClassConstructor.construct(child_klass)
        super
      end
    end

    # @since 0.1.0
    include SmartCore::Operation::Interface::Result
    # @since 0.1.0
    include SmartCore::Operation::Interface::Callable

    # @return [SmartCore::Operation::Result::Success]
    # @return [SmartCore::Operation::Result::Callback]
    # @return [SmartCore::Operation::Result::Failure]
    # @return [SmartCore::Operation::Result::Fatal]
    #
    # @api public
    # @since 0.1.0
    def call
      Success()
    end
  end

  class << self
    # @param type_system [String, Symbol]
    # @return [Class<SmartCore::Operation>]
    #
    # @api public
    # @since 0.1.0
    # rubocop:disable Naming/MethodName
    def Operation(type_system: SmartCore::Operation::ClassConsructor.default_type_system)
      SmartCore::Operation::ClassConsructor.construct(type_system: type_system)
    end
    # rubocop:enable Naming/MethodName
  end
end
