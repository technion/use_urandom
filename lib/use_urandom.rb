require "use_urandom/version"

module SecureRandom
  class << self
    alias_method :original_gen_random, :gen_random

    def gen_random(n)
      begin
        UseUrandom::urandom(n)
      rescue
        warn "Using original"
        original_gen_random(n)
      end
    end
  end
end

module UseUrandom
  URANDOM = "/dev/urandom"
  def self.urandom(n)
    fh = File.open URANDOM, 'rb'
    raise "Invalid urandom file" unless (fh.stat.uid == 0 && fh.stat.gid == 0)
    data = fh.read(n)
    raise "Not enough data read" unless data.size == n
    data

  end
end
