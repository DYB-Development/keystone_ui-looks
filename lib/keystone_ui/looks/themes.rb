# frozen_string_literal: true

module KeystoneUi
  module Looks
    module Themes
      PRESETS = {
        graphite: {
          label: "Graphite",
          description: "Plain greys with a near-black primary and soft medium corners"
        },
        harbor: {
          label: "Harbor",
          description: "Cool blues on a faintly blue page with rounded corners"
        },
        fern: {
          label: "Fern",
          description: "Deep leaf greens with serif headings and generous corners"
        },
        terracotta: {
          label: "Terracotta",
          description: "Warm clay and amber on a cream page with small corners"
        },
        heather: {
          label: "Heather",
          description: "Muted violet and soft lilac greys with large rounded corners"
        },
        ledger: {
          label: "Ledger",
          description: "Tight and sharp ink and teal with small corners, close spacing and no shadow"
        }
      }.freeze

      def self.all
        PRESETS
      end

      def self.[](name)
        PRESETS.fetch(name.to_sym)
      end

      def self.names
        PRESETS.keys
      end
    end
  end
end
