# frozen_string_literal: true

require "test_helper"

class KeystoneUi::Looks::EveryLookTest < Minitest::Test
  LOOKS_DIR = File.expand_path("../../../app/assets/tailwind/keystone_ui_looks", __dir__)
  STYLES = File.join(Gem.loaded_specs.fetch("keystone_ui-styles").full_gem_path, "app/assets/tailwind/keystone_ui_styles/engine.css")

  def test_no_look_sets_a_variable_keystone_ui_styles_does_not_define
    defined = File.read(STYLES).scan(/(--ks-[\w-]+):/).flatten.uniq
    unknown = declarations_by_look.transform_values { |declarations| declarations.keys - defined }.reject { |_, names| names.empty? }

    assert_equal({}, unknown)
  end

  private

  def declarations_by_look
    KeystoneUi::Looks::Engine::LOOKS.to_h do |look|
      css = File.read(File.join(LOOKS_DIR, "#{look}.css"))
      [ look, css[/:root\[data-look="#{look}"\] \{(.*?)\}/m, 1].scan(/(--ks-[\w-]+):\s*([^;]+);/).to_h ]
    end
  end
end
