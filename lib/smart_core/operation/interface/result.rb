# frozen_string_literal: true

# @api public
# @since 0.1.0
# rubocop:disable Naming/MethodName
module SmartCore::Operation::Interface::Result
  # @param result_attributes [Hash<Symbol,Any>]
  # @return [SmartCore::Operation::Result::Success]
  #
  # @api public
  # @since 0.1.0
  def Success(**result_attributes)
    SmartCore::Operation::Result::Success.new(**result_attributes)
  end

  # @param result_attributs [Array<Any>]
  # @return [SmartCore::Operation::Result::Failure]
  #
  # @api public
  # @since 0.1.0
  def Failure(*result_attributes)
    SmartCore::Operation::Result::Failure.new(*result_attributes)
  end

  # @param result_attributes [Array<Any>]
  # @return [SmartCore::Operation::Result::Fatal]
  #
  # @api public
  # @since 0.1.0
  def Fatal(*result_attributes)
    raise(SmartCore::Operation::Result::Fatal.new(*result_attributes))
  end

  # @param callback [Block]
  # @return [SmartCore::Operation::Result::Callback]
  #
  # @api public
  # @since 0.1.0
  def Callback(&callback)
    SmartCore::Operation::Result::Callback.new(&callback)
  end
end
# rubocop:enable Naming/MethodName
