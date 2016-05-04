require "use_urandom/version"

module SecureRandom
  # Hooks SecureRandom's self.gen_random
  class << self
    alias_method :original_gen_random, :gen_random

    def gen_random(n)
      begin
        UseUrandom::urandom(n)
      rescue
        # Fallback code - UseRandom raises exceptions on any problem
        warn "Using original"
        original_gen_random(n)
      end
    end
  end
end

module UseUrandom
  URANDOM = "/dev/urandom"

  # Reads 'n' bytes from URANDOm
  def self.urandom(n)
    # Facilitates testing
    device = ($urandom_file_test.nil?) ? URANDOM : $urandom_file_test
    fh = File.open device, 'rb'
    # Sanity test - owned by root
    raise "Invalid urandom file" unless (fh.stat.uid == 0 && fh.stat.chardev?)
    data = fh.read(n)
    fh.close
    raise "Not enough data read" unless data.size == n
    data
  end
end
