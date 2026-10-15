# frozen_string_literal: true

require "test_helper"

class KeystoneUi::Looks::ThemesTest < Minitest::Test
  def test_names_the_six_preset_themes
    assert_equal %i[graphite harbor fern terracotta heather ledger], KeystoneUi::Looks::Themes.names
  end
end
