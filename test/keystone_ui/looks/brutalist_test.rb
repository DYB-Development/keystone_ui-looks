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

  private

  def declarations
    File.read(FILE)[/:root\[data-look="brutalist"\] \{(.*?)\}/m, 1].scan(/(--ks-[\w-]+):\s*([^;]+);/).to_h
  end
end
