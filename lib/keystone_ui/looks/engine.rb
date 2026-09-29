# frozen_string_literal: true

require "rails"

module KeystoneUi
  module Looks
    class Engine < ::Rails::Engine
      LOOKS = %w[brutalist compact rounded soft].freeze

      engine_name "keystone_ui_looks_engine"

      initializer "keystone_ui_looks.register" do
        KeystoneUi.configure do |config|
          LOOKS.each do |look|
            config.register_look look, root.join("app/assets/tailwind/keystone_ui_looks/#{look}.css")
          end
        end
      end
    end
  end
end
