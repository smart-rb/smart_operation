# frozen_string_literal: true

# @api public
# @since 0.1.0
class SmartCore::Operation::Result::Success < SmartCore::Operation::Result::Basic
  # @param result_options [Hash<Symbol,Any>]
  # @return [void]
  #
  # @api public
  # @since 0.1.0
  def initialize(**result_options)
    __prevent_core_methods_overlapping__(result_options)
    super(result_options)
    __define_virtual_acessors__(result_options)
  end

  # @return [Boolean]
  #
  # @api public
  # @since 0.1.0
  def success?
    true
  end

  # @return [Hash<Symbol,Any>]
  #
  # @api public
  # @since 0.1.0
  def to_h
    __result_options__.dup
  end
  alias_method :to_hash, :to_h

  private

  # @param result_options [Hash<Symbol,Any>]
  # @return [void]
  #
  # @api private
  # @since 0.1.0
  def __prevent_core_methods_overlapping__(result_options)
    overlappings = result_options.each_key.each_with_object([]) do |key, overlap|
      overlap << key if self.class.____core_methods____.include?(key)
    end

    if overlappings.any?
      raise(SmartCore::Operation::ResultCoreMethodOverlapError, <<~ERROR_MESSAGE)
        Result keys can not overlap core methods (operlapped keys: #{overlappings.join(', ')}).
      ERROR_MESSAGE
    end
  end

  # @param result_options [Hash<Symbol,Any>]
  # @return [void]
  #
  # @api private
  # @since 0.1.0
  def __define_virtual_acessors__(result_options)
    result_options.each_key do |result_attribute_name|
      define_singleton_method(result_attribute_name) do
        result_options[result_attribute_name]
      end
    end
  end

  # @since 0.1.0
  core_methods = [
    *instance_methods(false),
    *private_instance_methods(false),
    *superclass.instance_methods(false),
    *superclass.private_instance_methods(false),
    :____core_methods____
  ].freeze

  # @return [Array<Symbol>]
  #
  # @api private
  # @since 0.2.0
  define_singleton_method(:____core_methods____) { core_methods }
end
