module Encoder
  class PurchaseItem < Base
    Seed   = 6874219
    def initialize(options = {})
      options.reverse_merge!(seed: Seed)
      super options
    end
  end
end
