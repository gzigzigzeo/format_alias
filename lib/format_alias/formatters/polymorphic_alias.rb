module FormatAlias
  module Base
    module ClassMethods
      def polymorphic_alias(attr, *args)
        options = args.extract_options!
        polymorphic = options.delete(:polymorphic) || true
        attrs = options.delete(:attrs)
        delim = options.delete(:delimiter) || ':'

        raise ArgumentError, "Specify :polymorphic or :attrs option for polymorphic_alias :#{attr} in #{self.name}" if attrs.blank? && polymorphic.blank?

        if polymorphic
          attrs = ["#{attr}_type", "#{attr}_id"]
          options[:as] ||= "#{attr}_type_id"
        else
          options[:as] ||= "#{attr}_split"
        end
      
        format_alias(
          attr,
          proc {
            r = attrs.map { |a| send(a) }.compact
            r.present? ? r.join(delim) : nil
          },
          proc { |value|
            values = value.to_s.split(delim)
            h = Hash[attrs.zip(values)]
            h.map { |a, v| send("#{a}=", v) }
          },
          options
        )
      end
    end
  end
end