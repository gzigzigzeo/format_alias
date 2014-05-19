module FormatAlias
  def date_format_alias(name, format, options = {})
    define_setter_alias(name, options) do |value|
      time = Time.parse(value, format) rescue nil
      { name => time }
    end

    define_getter_alias(name, options) do |value|
      value.strftime(format) unless value.nil?
    end
  end
end