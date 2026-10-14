# frozen_string_literal: true

require "test_helper"

class KeystoneUi::Looks::PalettesTest < Minitest::Test
  def test_lists_the_six_accent_scales_by_name
    assert_equal %i[blue emerald cyan indigo violet rose], KeystoneUi::Looks::Palettes::ACCENTS.keys
  end
end
