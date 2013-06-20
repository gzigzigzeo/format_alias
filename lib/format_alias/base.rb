require 'active_support/core_ext/array/extract_options'

module FormatAlias
  module Base
    extend ActiveSupport::Concern

    module ClassMethods
      def format_alias(attr, getter, setter, *args)
        options = args.extract_options!
        name = options.delete(:as) || "#{attr}_formatted"

        define_method name, &getter
        define_method "#{name}=", &setter
      end
    end
  end
end