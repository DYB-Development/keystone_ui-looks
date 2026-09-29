# frozen_string_literal: true

require "test_helper"

class KeystoneUi::Looks::ReadmeTest < Minitest::Test
  README = File.expand_path("../../../README.md", __dir__)

  def test_the_readme_lists_every_look_the_gem_registers
    listed = File.read(README).scan(/^\| `([a-z]+)` \|/).flatten

    assert_equal KeystoneUi::Looks::Engine::LOOKS, listed
  end
end
