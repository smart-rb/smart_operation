# frozen_string_literal: true

# @api public
# @since 0.1.0
module SmartCore::Operation::Interface::Callable
  class << self
    # @param base_klass [Class]
    # @return [void]
    #
    # @api private
    # @since 0.1.0
    def included(base_klass)
      base_klass.extend(ClassMethods)
    end
  end

  # @api private
  # @since 0.1.0
  module ClassMethods
    # @param arguments [Array<Any>]
    # @param block [Block]
    # @return [Any]
    #
    # @api public
    # @since 0.1.0
    def call(*arguments, &block)
      new(*arguments).call(&block)
    end
  end
end
