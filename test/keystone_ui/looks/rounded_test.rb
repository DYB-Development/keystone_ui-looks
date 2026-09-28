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

  def test_the_look_lifts_surfaces_with_soft_shadows
    assert_equal({ "--ks-shadow-surface" => "0 1px 2px rgb(0 0 0 / 0.3), 0 1px 3px 1px rgb(0 0 0 / 0.15)", "--ks-shadow-menu" => "0 1px 2px rgb(0 0 0 / 0.3), 0 2px 6px 2px rgb(0 0 0 / 0.15)", "--ks-shadow-overlay" => "0 1px 3px rgb(0 0 0 / 0.3), 0 4px 8px 3px rgb(0 0 0 / 0.15)" }, declarations.slice("--ks-shadow-surface", "--ks-shadow-menu", "--ks-shadow-overlay"))
  end

  def test_the_look_uses_medium_weights
    assert_equal({ "--ks-font-weight-strong" => "500", "--ks-font-weight-heading" => "500", "--ks-font-weight-medium" => "500" }, declarations.slice("--ks-font-weight-strong", "--ks-font-weight-heading", "--ks-font-weight-medium"))
  end

  def test_the_look_names_roboto_with_a_system_fallback
    assert_equal({ "--ks-font-body" => "Roboto, system-ui, sans-serif" }, declarations.slice("--ks-font-body"))
  end

  private

  def declarations
    File.read(FILE)[/:root\[data-look="rounded"\] \{(.*?)\}/m, 1].scan(/(--ks-[\w-]+):\s*([^;]+);/).to_h
  end
end
