require 'rails'
require 'rails/generators'
require 'rails/generators/migration'

class StatusDistance < Rails::Railtie

  initializer 'status_quo' do
    ActiveSupport.on_load :active_record do
      require "status_quo/status_quo"
    end
  end
end