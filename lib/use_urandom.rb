require "use_urandom/version"

module SecureRandom
  # A constant for the file path used

  URANDOM = "/dev/urandom"
  # Hooks SecureRandom's self.gen_random
  class << self
    alias_method :original_gen_random, :gen_random

    def gen_random(n)
      begin
        UseUrandom.urandom(n)
      rescue
        # Fallback code - UseRandom raises exceptions on any problem
        warn "Using original SecureRandom"
        original_gen_random(n)
      end
    end
  end
end

module UseUrandom

  # Reads 'n' bytes from URANDOm
  def self.urandom(n)
    # Facilitates testing
    fh = File.open SecureRandom::URANDOM, 'rb'
    # Sanity test - owned by root
    raise "Invalid urandom file" unless (fh.stat.uid == 0 && fh.stat.chardev?)
    data = fh.read(n)
    fh.close
    raise "Not enough data read" unless data.size == n
    data
  end
end
