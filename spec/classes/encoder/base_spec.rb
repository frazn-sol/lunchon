require 'spec_helper'

module Encoder 
  describe Base do
    let(:encoder) {Base.new}

    it 'encodes' do
      encoder.respond_to?(:encode).should be_true
    end

    it 'returns a string' do
      encoder.encode(5).should be_a String
    end

    it 'takes a string or an int as the argument' do
      encoder.encode(5).should be_a String
      encoder.encode('5').should be_a String
    end

    it 'returns a string of predetermined length' do
      [3,5,6,10,55,65,56,100,1005].each do |e|
        encoder.encode(e).length.should == encoder.required_length+1
        encoder.encode(e.to_s).length.should == encoder.required_length+1
      end
    end

    it 'returns the length of the input as the first char of the output' do
      encoder.encode(5)[0].should == '1'
      encoder.encode(15)[0].should == '2'
      encoder.encode(125)[0].should == '3'
    end

    it 'does not return sequential output for sequential input' do
      e1 = encoder.encode(5).to_i
      e2 = encoder.encode(6).to_i
      e1.should_not be_within(1).of e2
    end

    it 'decodes correctly' do
      [1,3,5,6,10,55,65,56,100,1005].each do |e|
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
