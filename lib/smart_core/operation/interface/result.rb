# frozen_string_literal: true

# @api public
# @since 0.1.0
module SmartCore::Operation::Interface::Result
  # @return [SmartCore::Operation::Result::Success]
  #
  # @api public
  # @since 0.1.0
  def Success
    SmartCore::Operation::Result::Success.new
  end

  # @return [SmartCore::Operation::Result::Failure]
  #
  # @api public
  # @since 0.1.0
  def Failure
    SmartCore::Operation::Result::Failure.new
  end

  # @return [SmartCore::Operation::Result::Fatal]
  #
  # @api public
  # @since 0.1.0
  def Fatal
    SmartCore::Operation::Result::Fatal.new
  end

  # @return [SmartCore::Operation::Result::Callback]
  #
  # @api public
  # @since 0.1.0
  def Callback
    SmartCore::Operation::Result::Callback.new
  end
end
