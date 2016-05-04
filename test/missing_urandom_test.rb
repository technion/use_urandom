require 'test_helper'

class MissingUrandomTest < Minitest::Test
  def test_cannot_open
    # Exception test
    $urandom_file_test = "missingfile"
    assert_raises Errno::ENOENT do
      ::UseUrandom::urandom(10)
    end
    $urandom_file_test = nil
  end
end

