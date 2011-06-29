module FormatAlias
  module Base
    module ClassMethods
      def date_format_alias(attr, format, *args)
        format_alias(
          attr,
          proc { send(attr).strftime(format) unless send(attr).nil? },
          proc { |value| send(:"#{attr}=", (Time.parse(value, format) rescue nil)) },
          *args
        )
      end
    end
  end
end