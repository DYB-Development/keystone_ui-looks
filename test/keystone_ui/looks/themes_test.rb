# frozen_string_literal: true

require "test_helper"

class KeystoneUi::Looks::ThemesTest < Minitest::Test
  def test_names_the_six_preset_themes
    assert_equal %i[graphite harbor fern terracotta heather ledger], KeystoneUi::Looks::Themes.names
  end
  def test_reads_a_preset_theme_by_name
    assert_same KeystoneUi::Looks::Themes::PRESETS[:harbor], KeystoneUi::Looks::Themes["harbor"]
  end
end
