# frozen_string_literal: true

# @api public
# @since 0.1.0
module SmartCore::Operation::Interface::DI
  class << self
    # @param base_klass [Class]
    # @return [void]
    #
    # @api private
    # @since 0.1.0
    def included(base_klass)
      base_klass.include(::SmartCore::Injection)
    end
  end
end
