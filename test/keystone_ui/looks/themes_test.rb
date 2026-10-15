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
  def test_labels_each_preset_theme
    expected = { graphite: "Graphite", harbor: "Harbor", fern: "Fern", terracotta: "Terracotta", heather: "Heather", ledger: "Ledger" }

    assert_equal expected, KeystoneUi::Looks::Themes.all.transform_values { |preset| preset[:label] }
  end
  def test_describes_each_preset_theme_in_one_sentence
    expected = {
      graphite: "Plain greys with a near-black primary and soft medium corners",
      harbor: "Cool blues on a faintly blue page with rounded corners",
      fern: "Deep leaf greens with serif headings and generous corners",
      terracotta: "Warm clay and amber on a cream page with small corners",
      heather: "Muted violet and soft lilac greys with large rounded corners",
      ledger: "Tight and sharp ink and teal with small corners, close spacing and no shadow"
    }

    assert_equal expected, KeystoneUi::Looks::Themes.all.transform_values { |preset| preset[:description] }
  end
end
