module Encoder
  class Base
    Seed = 1834
    attr_accessor :seed, :required_length
    def initialize(options={})
      @seed = options.fetch(:seed, Seed)
      @required_length = options.fetch(:required_length, @seed.to_s.length)
    end

    def encode(id)
      @id = id.to_i.to_s
      "#{original_length}#{encoded_str}"
    end

    def decode(code)
      @code = code
      de_xored[0...coded_length]
    end

    private
    def de_xored
      (@code[1..-1].to_i^seed).to_s
    end

    def coded_length
      @code[0].to_i
    end

    def original_length
      @id.length
    end

    def encoded_str
      encoded_val.to_s.rjust(required_length, '0')
    end

    def encoded_val
      padded_id^seed
    end

    def padded_id
      @id.ljust(required_length, @id).to_i
    end
  end

end
