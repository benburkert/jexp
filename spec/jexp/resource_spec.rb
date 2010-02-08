require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe JEXP::Resource do
  before(:each) do
    @klass = Class.new(Struct.new(:foo, :bar)) do
      include JEXP::Resource
    end
  end

  describe ".new" do
    it 'accepts a hash of member names mapped to values' do

      instance = @klass.new(:foo => 123, :bar => 456)
      instance.foo.should == 123
      instance.bar.should == 456
    end

    it 'accepts symbol keys' do
      instance = @klass.new(:bar => 123, :foo => 456)
      instance.foo.should == 456
      instance.bar.should == 123
    end
  end

  describe "#to_hash" do
    it 'returns a hash of members mapped to values' do
      @klass.new(:bar => 123, :foo => 456).to_hash.should ==
        {'bar' => 123, 'foo' => 456}
    end
  end

  it 'can dump and load JSON' do
    original = @klass.new(:foo => 'abc', :bar => {'bar' => 123})
    copy = @klass.new(JSON.parse(original.to_json))
    copy.should == original
  end
end
