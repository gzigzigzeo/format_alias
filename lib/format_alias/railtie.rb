module FormatAlias
  if defined?(Rails::Railtie)
    class Railtie < Rails::Railtie
    end
  end
end