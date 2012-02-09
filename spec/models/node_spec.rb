require 'spec_helper'

describe Node do
  before do
    Chef::Client.any_instance.stub(:get).and_return({"shard2" => "http://example.com/"})
  end

  it "fetches & parsers information about nodes" do
    nodes = Node.all

    nodes.first.name.should == "shard2"
  end
end