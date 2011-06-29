module FormatAlias
  if defined?(Rails::Railtie)
    class Railtie < Rails::Railtie
      initializer 'format_alias.extend_active_record' do
        ActiveSupport.on_load :active_record do
          ActiveRecord::Base.send(:include, FormatAlias::Base)
        end
      end
    end
  end
end  