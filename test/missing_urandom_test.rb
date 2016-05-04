require 'test_helper'
require 'minitest/stub_const'

class InvalidUrandomTest < Minitest::Test
  def test_cannot_open
    # Exception test
    SecureRandom.stub_const(:URANDOM, "missingfile") do
      assert_raises Errno::ENOENT do
        ::UseUrandom.urandom(10)
      end
    end
  end
  def test__open
    # Exception test - not character device
    SecureRandom.stub_const(:URANDOM, "/etc/passwd") do
      out, err = capture_io do
        ::SecureRandom.gen_random(10)
      end
      assert_equal "Using original SecureRandom\n", err
    end
  end
end

