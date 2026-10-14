# frozen_string_literal: true

require "test_helper"
require "keystone_ui"

class KeystoneUi::Looks::SharpTest < Minitest::Test
  FILE = File.expand_path("../../../app/assets/tailwind/keystone_ui_looks/sharp.css", __dir__)

  def test_the_look_passes_keystone_uis_boot_check
    assert_nil KeystoneUi::LookCheck.new(looks: { "sharp" => FILE }, default: nil).call
  end

  def test_the_look_gives_controls_2px_corners
    assert_equal({ "--ks-radius-control" => "2px" }, declarations.slice("--ks-radius-control"))
  end

  def test_the_look_gives_surfaces_4px_corners
    assert_equal({ "--ks-radius-surface" => "4px" }, declarations.slice("--ks-radius-surface"))
  end

  def test_the_look_gives_badges_2px_corners
    assert_equal({ "--ks-radius-pill" => "2px" }, declarations.slice("--ks-radius-pill"))
  end

  def test_the_look_spaces_components_tightly
    assert_equal({ "--ks-spacing" => "0.2rem" }, declarations.slice("--ks-spacing"))
  end

  def test_the_look_sets_button_and_label_text_in_medium_weight
    assert_equal({ "--ks-font-weight-strong" => "500", "--ks-font-weight-medium" => "500" }, declarations.slice("--ks-font-weight-strong", "--ks-font-weight-medium"))
  end

  def test_the_look_gives_surfaces_no_shadow_in_light_and_dark_mode
    assert_equal({ "--ks-shadow-surface" => "none", "--ks-shadow-surface-dark" => "none" }, declarations.slice("--ks-shadow-surface", "--ks-shadow-surface-dark"))
  end

  private

  def declarations
    File.read(FILE)[/:root\[data-look="sharp"\] \{(.*?)\}/m, 1].scan(/(--ks-[\w-]+):\s*([^;]+);/).to_h
  end
end
