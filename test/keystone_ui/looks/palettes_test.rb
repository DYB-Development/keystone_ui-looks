# frozen_string_literal: true

require "test_helper"

class KeystoneUi::Looks::PalettesTest < Minitest::Test
  def test_lists_the_six_accent_scales_by_name
    assert_equal %i[blue emerald cyan indigo violet rose], KeystoneUi::Looks::Palettes::ACCENTS.keys
  end
  def test_reads_an_accent_scale_by_name
    assert_equal "#2563eb", KeystoneUi::Looks::Palettes.accent("blue")[600]
  end
  def test_refuses_an_accent_scale_it_does_not_have
    assert_raises(KeyError) { KeystoneUi::Looks::Palettes.accent(:nope) }
  end
  def test_lists_the_five_surface_scales_by_name
    assert_equal %i[zinc slate gray neutral stone], KeystoneUi::Looks::Palettes::SURFACES.keys
  end
  def test_reads_a_surface_scale_by_name
    assert_equal "#3f3f46", KeystoneUi::Looks::Palettes.surface("zinc")[700]
  end
  def test_refuses_a_surface_scale_it_does_not_have
    assert_raises(KeyError) { KeystoneUi::Looks::Palettes.surface(:nope) }
  end
  def test_generates_the_same_shade_scales_as_keystone_ui_colors
    expected = {
      "#3b82f6" => { 50 => "#f5f9ff", 100 => "#ebf3fe", 200 => "#d8e6fd", 300 => "#c4dafc", 400 => "#b1cdfb", 500 => "#3b82f6", 600 => "#326fd1", 700 => "#295bac", 800 => "#204887", 900 => "#183462", 950 => "#0f213e" },
      "#ff8000" => { 50 => "#fff9f2", 100 => "#fff2e6", 200 => "#ffe6cc", 300 => "#ffd9b3", 400 => "#ffcc99", 500 => "#ff8000", 600 => "#d96d00", 700 => "#b35a00", 800 => "#8c4600", 900 => "#663300", 950 => "#402000" },
      "#123456" => { 50 => "#f3f5f7", 100 => "#e7ebee", 200 => "#d0d6dd", 300 => "#b8c2cc", 400 => "#a0aebb", 500 => "#123456", 600 => "#0f2c49", 700 => "#0d243c", 800 => "#0a1d2f", 900 => "#071522", 950 => "#050d16" }
    }

    assert_equal expected, expected.keys.to_h { |hex| [ hex, KeystoneUi::Looks::Palettes.generate_shades(hex) ] }
  end
end
