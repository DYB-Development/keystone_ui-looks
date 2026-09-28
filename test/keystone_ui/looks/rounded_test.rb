# frozen_string_literal: true

require "test_helper"
require "keystone_ui"

class KeystoneUi::Looks::RoundedTest < Minitest::Test
  FILE = File.expand_path("../../../app/assets/tailwind/keystone_ui_looks/rounded.css", __dir__)

  def test_the_look_passes_keystone_uis_boot_check
    assert_nil KeystoneUi::LookCheck.new(looks: { "rounded" => FILE }, default: nil).call
  end

  def test_the_look_shapes_buttons_as_pills
    assert_equal({ "--ks-radius-control" => "9999px" }, declarations.slice("--ks-radius-control"))
  end

  def test_the_look_fills_controls_in_purple
    assert_equal({ "--ks-color-accent" => "#6750a4", "--ks-color-accent-hover" => "#7965af", "--ks-color-on-fill" => "#ffffff" }, declarations.slice("--ks-color-accent", "--ks-color-accent-hover", "--ks-color-on-fill"))
  end

  private

  def declarations
    File.read(FILE)[/:root\[data-look="rounded"\] \{(.*?)\}/m, 1].scan(/(--ks-[\w-]+):\s*([^;]+);/).to_h
  end
end
