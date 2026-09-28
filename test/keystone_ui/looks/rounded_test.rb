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

  private

  def declarations
    File.read(FILE)[/:root\[data-look="rounded"\] \{(.*?)\}/m, 1].scan(/(--ks-[\w-]+):\s*([^;]+);/).to_h
  end
end
