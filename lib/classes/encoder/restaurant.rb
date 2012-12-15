module Encoder
  class Restaurant < Base
    Seed   = 583
    def initialize(options = {})
      options.reverse_merge!(seed: Seed)
      super options
    end

    private
    def padded_id
      @id.ljust(required_length, @id).to_i
    end

  end
end
