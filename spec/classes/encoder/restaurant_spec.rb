
require 'spec_helper'

module Encoder 
  describe Restaurant do
    let(:encoder) {Encoder::Restaurant.new}

    it 'returns a string of predetermined length' do
      [3,5,6,10,55,65,56,100,1005].each do |e|
        encoder.encode(e).length.should == encoder.required_length+1
        encoder.encode(e.to_s).length.should == encoder.required_length+1
      end
    end
    it 'decodes correctly' do
      [3,5,6,10,55,65,56,100,1005].each do |e|
        e1 = encoder.encode(e)
        d1 = encoder.decode(e1)
        d1.should == e.to_s

        e1 = encoder.encode(e.to_s)
        d1 = encoder.decode(e1)
        d1.should == e.to_s
      end
    end
      

  end
end
