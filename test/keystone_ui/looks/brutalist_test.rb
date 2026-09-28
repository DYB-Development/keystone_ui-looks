# frozen_string_literal: true

require "test_helper"
require "keystone_ui"

class KeystoneUi::Looks::BrutalistTest < Minitest::Test
  FILE = File.expand_path("../../../app/assets/tailwind/keystone_ui_looks/brutalist.css", __dir__)

  def test_the_look_passes_keystone_uis_boot_check
    assert_nil KeystoneUi::LookCheck.new(looks: { "brutalist" => FILE }, default: nil).call
  end

  def test_the_look_squares_every_corner
    assert_equal({ "--ks-radius-control" => "0", "--ks-radius-surface" => "0", "--ks-radius-pill" => "0" }, declarations.slice("--ks-radius-control", "--ks-radius-surface", "--ks-radius-pill"))
  end

  def test_the_look_draws_thick_borders
    assert_equal({ "--ks-border-width" => "3px", "--ks-border-width-control" => "3px" }, declarations.slice("--ks-border-width", "--ks-border-width-control"))
  end

  def test_the_look_uses_bold_weights
    assert_equal({ "--ks-font-weight-strong" => "800", "--ks-font-weight-heading" => "800", "--ks-font-weight-medium" => "700" }, declarations.slice("--ks-font-weight-strong", "--ks-font-weight-heading", "--ks-font-weight-medium"))
  end

  def test_the_look_draws_no_shadows
    assert_equal({ "--ks-shadow-surface" => "none", "--ks-shadow-surface-dark" => "none", "--ks-shadow-overlay" => "none", "--ks-shadow-menu" => "none" }, declarations.slice("--ks-shadow-surface", "--ks-shadow-surface-dark", "--ks-shadow-overlay", "--ks-shadow-menu"))
  end

  def test_the_look_draws_black_on_white_and_white_on_black
    assert_equal({ "--ks-color-text" => "#000000", "--ks-color-text-dark" => "#ffffff", "--ks-color-surface" => "#ffffff", "--ks-color-surface-dark" => "#000000", "--ks-color-border" => "#000000", "--ks-color-border-dark" => "#ffffff" }, declarations.slice("--ks-color-text", "--ks-color-text-dark", "--ks-color-surface", "--ks-color-surface-dark", "--ks-color-border", "--ks-color-border-dark"))
  end

  def test_the_look_fills_controls_in_black_with_white_labels
    assert_equal({ "--ks-color-accent" => "#000000", "--ks-color-accent-hover" => "#262626", "--ks-color-on-fill" => "#ffffff" }, declarations.slice("--ks-color-accent", "--ks-color-accent-hover", "--ks-color-on-fill"))
  end

  def test_every_colour_the_look_sets_has_a_dark_partner
    colours = declarations.keys.grep(/\A--ks-color-/).reject { |name| name.end_with?("-dark") }

    assert_empty colours.reject { |name| declarations.key?("#{name}-dark") }
  end

  private

  def declarations
    File.read(FILE)[/:root\[data-look="brutalist"\] \{(.*?)\}/m, 1].scan(/(--ks-[\w-]+):\s*([^;]+);/).to_h
  end
end
