module FormatAlias
  def polymorphic_alias(name, options = {})
    delimiter  = options.delete(:delimiter) || ':'
    attributes = ["#{name}_type", "#{name}_id"]

    options_with_attributes = options.merge(attributes: attributes)

    define_setter_alias(name, options_with_attributes) do |value|
      values = value.to_s.split(delimiter)
      Hash[attributes.zip(values)]
    end

    define_getter_alias(name, options_with_attributes) do |*values|
      values = values.compact
      values.join(delimiter) if values.any?
    end
  end
end