# frozen_string_literal: true

require "minitest/autorun"
require "peasy_css"

class TestPeasyCSS < Minitest::Test
  def test_version
    refute_nil PeasyCSS::VERSION
    assert_equal "0.1.1", PeasyCSS::VERSION
  end
end
