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

  private

  def declarations
    File.read(FILE)[/:root\[data-look="compact"\] \{(.*?)\}/m, 1].scan(/(--ks-[\w-]+):\s*([^;]+);/).to_h
  end
end
