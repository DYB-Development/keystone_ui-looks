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

  private

  def declarations
    File.read(FILE)[/:root\[data-look="brutalist"\] \{(.*?)\}/m, 1].scan(/(--ks-[\w-]+):\s*([^;]+);/).to_h
  end
end
