# frozen_string_literal: true

module KeystoneUi
  module Looks
    module Themes
      PRESETS = {
        graphite: { label: "Graphite" },
        harbor: { label: "Harbor" },
        fern: { label: "Fern" },
        terracotta: { label: "Terracotta" },
        heather: { label: "Heather" },
        ledger: { label: "Ledger" }
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
