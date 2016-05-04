require 'test_helper'

class SecureRandomTest < Minitest::Test
  def test_monkey_patch
    assert SecureRandom::URANDOM
  end

  def test_gen_random
    100.times do
      assert SecureRandom.gen_random(10)
    end
    10.times do
      assert SecureRandom.gen_random(1024)
    end
  end

  def test_other_random
    # Funcrions we haven't touched - ensure they still work
    assert SecureRandom.urlsafe_base64
    assert SecureRandom.random_number(100)
  end
end
