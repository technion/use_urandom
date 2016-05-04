require 'test_helper'

class SecureRandomTest < Minitest::Test

  def test_monkey_patch
    assert SecureRandom::gen_random(10)
  end
end
