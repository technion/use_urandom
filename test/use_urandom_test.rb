require 'test_helper'

class UseUrandomTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::UseUrandom::VERSION
  end

  def test_it_does_run
    assert UseUrandom::urandom(10)
  end
end
