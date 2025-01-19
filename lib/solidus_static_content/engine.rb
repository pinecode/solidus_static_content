# frozen_string_literal: true

require 'solidus_core'
require 'solidus_support'

module SolidusStaticContent
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace ::Spree
    engine_name 'solidus_static_content'

    config.generators.test_framework :rspec

    config.to_prepare do
      Spree::Backend::Config.configure do |config|
        config.menu_items << Spree::BackendConfiguration::MenuItem.new(
          label: :pages,
          icon: 'file-text',
          url: :admin_pages_path,
          condition: -> { can?(:admin, Spree::Page) }
        )
      end
    end
  end
end
