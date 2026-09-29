# frozen_string_literal: true

require "rails"

module KeystoneUi
  module Looks
    class Engine < ::Rails::Engine
      engine_name "keystone_ui_looks_engine"

      initializer "keystone_ui_looks.register" do
        KeystoneUi.configure do |config|
          config.register_look :brutalist, root.join("app/assets/tailwind/keystone_ui_looks/brutalist.css")
          config.register_look :compact, root.join("app/assets/tailwind/keystone_ui_looks/compact.css")
          config.register_look :rounded, root.join("app/assets/tailwind/keystone_ui_looks/rounded.css")
          config.register_look :soft, root.join("app/assets/tailwind/keystone_ui_looks/soft.css")
        end
      end
    end
  end
end
