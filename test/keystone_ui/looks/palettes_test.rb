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
end
