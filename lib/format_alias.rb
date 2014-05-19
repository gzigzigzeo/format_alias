require 'time'
require 'active_support/concern'
require 'active_support/core_ext/object/blank'
require 'format_alias/version'
require 'format_alias/formatters/date'
require 'format_alias/formatters/polymorphic'
require 'format_alias/railtie'

module FormatAlias
  private
  def define_setter_alias(name, options, &setter)
    define_method setter_name(name, options) do |value|
      setter.call(value).each { |name, value| public_send("#{name}=", value) }
    end
  end

  def define_getter_alias(name, options, &getter)
    define_method getter_name(name, options) do
      attributes = options[:attributes] || [name]
      getter.call(*attributes.map { |name| public_send(name) })
    end
  end

  def alias_name(name, options, type)
    if options[:suffix].present?
      "#{name}_#{options[:suffix]}"
    elsif options[:"#{type}_name"].present?
      "#{options[:"#{type}_name"]}"
    else
      "#{name}_formatted"
    end
  end

  def setter_name(name, options)
    "#{alias_name(name, options, :setter)}="
  end

  def getter_name(name, options)
    alias_name(name, options, :getter)
  end
end