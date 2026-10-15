# frozen_string_literal: true

require "test_helper"

class KeystoneUi::Looks::ThemesTest < Minitest::Test
  COLOUR_ROLES = %w[
    background foreground card card-foreground popover popover-foreground primary primary-foreground
    secondary secondary-foreground muted muted-foreground accent accent-foreground destructive destructive-foreground
    border input ring chart-1 chart-2 chart-3 chart-4 chart-5
    sidebar sidebar-foreground sidebar-primary sidebar-primary-foreground sidebar-accent sidebar-accent-foreground sidebar-border sidebar-ring
  ].freeze
  SHAPE_AND_TYPE_ROLES = %w[
    radius spacing border-width letter-spacing font-sans font-serif font-mono font-heading
    font-weight-normal font-weight-medium font-weight-strong font-weight-heading
    shadow-color shadow-opacity shadow-blur shadow-spread shadow-offset-x shadow-offset-y
  ].freeze

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
  def test_sets_every_colour_role_in_light_and_in_dark
    expected = KeystoneUi::Looks::Themes.names.to_h { |name| [ name, COLOUR_ROLES ] }

    assert_equal expected, KeystoneUi::Looks::Themes.all.transform_values { |preset| preset[:theme].to_h.select { |_role, sides| sides.keys == %w[light dark] }.keys }
  end
  def test_sets_every_shape_and_type_setting_once
    expected = KeystoneUi::Looks::Themes.names.to_h { |name| [ name, SHAPE_AND_TYPE_ROLES ] }

    assert_equal expected, KeystoneUi::Looks::Themes.all.transform_values { |preset| preset[:theme].select { |_role, sides| sides.keys == %w[light] }.keys }
  end
end
