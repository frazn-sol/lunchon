module Encoder
  class Restaurant < Base
    Seed   = 5803
    def initialize(options = {})
      options.reverse_merge!(seed: Seed)
      super options
    end
  end
end
