require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "rails/all"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

Bundler.require(:default, Rails.env)


module IvanTheTerriblesBlog
  class Application < Rails::Application

    config.assets.enabled = true

  end
end
