# frozen_string_literal: true

require "test_helper"
require "rubygems"

class KeystoneUi::Looks::PackagingTest < Minitest::Test
  ROOT = File.expand_path("../../..", __dir__)

  def test_requires_a_keystone_ui_that_registers_looks
    requirement = Gem::Specification.load(File.join(ROOT, "keystone_ui-looks.gemspec")).dependencies.find { |d| d.name == "keystone_ui" }&.requirement

    refute requirement.nil? || requirement.satisfied_by?(Gem::Version.new("0.19.0"))
  end
end
