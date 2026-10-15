# frozen_string_literal: true

require "test_helper"

class KeystoneUi::Looks::ThemesTest < Minitest::Test
  def test_names_the_six_preset_themes
    assert_equal %i[graphite harbor fern terracotta heather ledger], KeystoneUi::Looks::Themes.names
  end
  def test_reads_a_preset_theme_by_name
    assert_same KeystoneUi::Looks::Themes::PRESETS[:harbor], KeystoneUi::Looks::Themes["harbor"]
  end
  def test_refuses_a_preset_theme_it_does_not_have
    assert_raises(KeyError) { KeystoneUi::Looks::Themes[:ocean] }
  end
  def test_lists_every_preset_theme
    assert_same KeystoneUi::Looks::Themes::PRESETS, KeystoneUi::Looks::Themes.all
  end
end
