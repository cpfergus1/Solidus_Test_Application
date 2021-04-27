require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AmazingStore
  class Application < Rails::Application
    # Load application's model / class decorators
    initializer 'spree.decorators' do |app|
      config.to_prepare do
        Dir.glob(Rails.root.join('app/**/*_decorator*.rb')) do |path|
          require_dependency(path)
        end
      end
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.sass.load_paths += [Rails.root.join('vendor','assests','stylesheets', 'spree','frontend')]
    config.active_job.queue_adapter = :sidekiq
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't initialize this if factory_bot_rails is not part of the
    # current bundle group.
    if defined?(FactoryBotRails)
      initializer after: "factory_bot.set_factory_paths" do
        require 'spree/testing_support'
        # The paths for solidus factories.
        solidus_paths = Spree::TestingSupport::FactoryBot.definition_file_paths

        # The paths for extensions may be in different places, please refer to each extension
        # and add the factories you require without the ".rb" extension, avoid the directory
        # as it's supported by FactoryBot but can generate ambigous paths when a file with the
        # same name exists.
        extension_paths = []
        #  [
        #   MySolidusExtension::Engine.root.join("lib/solidus_content/factories.rb"),
        #   # alternative 1: MySolidusExtension::Engine.root.join("lib/solidus_content/factories/product.rb"),
        #   # alternative 2: MySolidusExtension::Engine.root.join("lib/solidus_content/factories/product_factory.rb"),
        #   # etc.
        # ].map { |path| path.chomp(".rb") }

        # The application factories, according to the place in which they're stored.
        app_paths = [
          Rails.root.join('lib', 'factories'),
          Rails.root.join('spec', 'factories'),
        ]

        FactoryBot.definition_file_paths = solidus_paths + extension_paths + app_paths
      end
    end
  end
end
