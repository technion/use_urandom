require 'test_helper'

class UseUrandomTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::UseUrandom::VERSION
  end

  def test_it_does_something_useful
    assert UseUrandom::gen_random(10)
  end
end
