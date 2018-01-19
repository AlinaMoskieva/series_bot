require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module RailsBase
  class Application < Rails::Application
    config.load_defaults 5.1
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]
    config.telegram_updates_controller.session_store = :file_store, Rails.root.join("tmp", "session_store")
  end
end
