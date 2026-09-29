# frozen_string_literal: true

require "test_helper"
require "keystone_ui"

class KeystoneUi::Looks::SoftTest < Minitest::Test
  FILE = File.expand_path("../../../app/assets/tailwind/keystone_ui_looks/soft.css", __dir__)

  def test_the_look_passes_keystone_uis_boot_check
    assert_nil KeystoneUi::LookCheck.new(looks: { "soft" => FILE }, default: nil).call
  end

  def test_the_look_rounds_surfaces_with_a_large_radius
    assert_equal({ "--ks-radius-surface" => "1rem" }, declarations.slice("--ks-radius-surface"))
  end

  def test_the_look_uses_the_devices_system_font
    assert_equal({ "--ks-font-body" => "-apple-system, BlinkMacSystemFont, system-ui, sans-serif" }, declarations.slice("--ks-font-body"))
  end

  private

  def declarations
    File.read(FILE)[/:root\[data-look="soft"\] \{(.*?)\}/m, 1].scan(/(--ks-[\w-]+):\s*([^;]+);/).to_h
  end
end
