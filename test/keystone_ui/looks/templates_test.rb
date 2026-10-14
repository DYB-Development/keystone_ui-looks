# frozen_string_literal: true

require "test_helper"

class KeystoneUi::Looks::TemplatesTest < Minitest::Test
  def test_lists_the_five_named_templates_with_their_colours_label_and_description
    expected = {
      ocean: { accent: :blue, surface: :slate, background: "#e0f2fe", text: "#0c4a6e", label: "Ocean", description: "Cool blues with slate undertones" },
      forest: { accent: :emerald, surface: :stone, background: "#ecfdf5", text: "#064e3b", label: "Forest", description: "Natural greens with warm stone" },
      twilight: { accent: :violet, surface: :zinc, background: "#1e1b4b", text: "#ede9fe", label: "Twilight", description: "Deep violet with clean zinc" },
      coral: { accent: :rose, surface: :neutral, background: "#fff1f2", text: "#4c0519", label: "Coral", description: "Warm rose with neutral balance" },
      arctic: { accent: :cyan, surface: :gray, background: "#ecfeff", text: "#164e63", label: "Arctic", description: "Bright cyan with crisp gray" }
    }

    assert_equal expected, KeystoneUi::Looks::Templates.all
  end
  def test_names_the_five_templates
    assert_equal %i[ocean forest twilight coral arctic], KeystoneUi::Looks::Templates.names
  end
  def test_reads_a_template_by_name
    assert_equal "Ocean", KeystoneUi::Looks::Templates["ocean"][:label]
  end
end
