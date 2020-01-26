# frozen_string_literal: true

# @api private
# @since 0.1.0
class SmartCore::Operation::Result::Basic
  # @return [Boolean]
  #
  # @api public
  # @since 0.1.0
  def success?
    false
  end

  # @return [Boolean]
  #
  # @api public
  # @since 0.1.0
  def failure?
    false
  end

  # @return [Boolean]
  #
  # @api public
  # @since 0.1.0
  def fatal?
    false
  end

  # @return [Boolean]
  #
  # @api public
  # @since 0.1.0
  def callback?
    false
  end
end
