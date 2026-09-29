# frozen_string_literal: true

require "test_helper"
require "keystone_ui"
require "keystone_ui/looks/engine"

class KeystoneUi::Looks::EngineTest < Minitest::Test
  def teardown
    KeystoneUi.reset_configuration!
  end

  def test_booting_registers_the_brutalist_look
    boot

    assert_equal KeystoneUi::Looks::Engine.root.join("app/assets/tailwind/keystone_ui_looks/brutalist.css").to_s, KeystoneUi.configuration.looks["brutalist"]
  end

  def test_booting_registers_the_rounded_look
    boot

    assert_equal KeystoneUi::Looks::Engine.root.join("app/assets/tailwind/keystone_ui_looks/rounded.css").to_s, KeystoneUi.configuration.looks["rounded"]
  end

  def test_booting_registers_the_soft_look
    boot

    assert_equal KeystoneUi::Looks::Engine.root.join("app/assets/tailwind/keystone_ui_looks/soft.css").to_s, KeystoneUi.configuration.looks["soft"]
  end

  def test_booting_registers_the_compact_look
    boot

    assert_equal KeystoneUi::Looks::Engine.root.join("app/assets/tailwind/keystone_ui_looks/compact.css").to_s, KeystoneUi.configuration.looks["compact"]
  end

  def test_booting_registers_exactly_the_looks_on_the_gems_list
    boot

    assert_equal KeystoneUi::Looks::Engine::LOOKS, KeystoneUi.configuration.looks.keys
  end

  private

  def boot
    KeystoneUi::Looks::Engine.initializers
      .find { |initializer| initializer.name == "keystone_ui_looks.register" }
      .bind(KeystoneUi::Looks::Engine.instance)
      .run(nil)
  end

  def test_booting_leaves_the_apps_default_look_alone
    boot

    assert_nil KeystoneUi.configuration.default_look
  end
end
