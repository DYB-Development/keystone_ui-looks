# frozen_string_literal: true

require "test_helper"
require "keystone_ui"

class KeystoneUi::Looks::CompactTest < Minitest::Test
  FILE = File.expand_path("../../../app/assets/tailwind/keystone_ui_looks/compact.css", __dir__)

  def test_the_look_passes_keystone_uis_boot_check
    assert_nil KeystoneUi::LookCheck.new(looks: { "compact" => FILE }, default: nil).call
  end

  def test_the_look_gives_surfaces_a_small_radius
    assert_equal({ "--ks-radius-surface" => "3px" }, declarations.slice("--ks-radius-surface"))
  end

  def test_the_look_fills_controls_in_blue
    assert_equal({ "--ks-color-accent" => "#0c66e4", "--ks-color-accent-hover" => "#0055cc", "--ks-color-on-fill" => "#ffffff" }, declarations.slice("--ks-color-accent", "--ks-color-accent-hover", "--ks-color-on-fill"))
  end

  def test_the_look_draws_thin_light_grey_borders
    assert_equal({ "--ks-border-width" => "1px", "--ks-color-border" => "#dcdfe4" }, declarations.slice("--ks-border-width", "--ks-color-border"))
  end

  def test_the_look_spaces_components_tightly
    assert_equal({ "--ks-spacing" => "0.2rem" }, declarations.slice("--ks-spacing"))
  end

  def test_every_colour_the_look_sets_has_a_dark_partner
    colours = declarations.keys.grep(/\A--ks-color-/).reject { |name| name.end_with?("-dark") }

    assert_empty colours.reject { |name| declarations.key?("#{name}-dark") }
  end

  private

  def declarations
    File.read(FILE)[/:root\[data-look="compact"\] \{(.*?)\}/m, 1].scan(/(--ks-[\w-]+):\s*([^;]+);/).to_h
  end
end
