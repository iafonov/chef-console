require 'spec_helper'

describe Chef::Resource do
  class TestResource < Chef::Resource
  end

  let(:client) { mock("client") }

  before do
    Chef::Resource.stub(:client).and_return(client)
  end

  describe "#get" do
    it "automatically builds url for fetching resources collection from resource class name" do
      client.should_receive(:get).with("testresources").and_return("name" => "url")

      TestResource.all
    end

    it "builds collection of resources" do
      client.stub(:get).and_return("name" => "url", "name2" => "url2")

      resource_collection = TestResource.all
      resource_collection.size.should == 2
      resource_collection.first.should be_kind_of(TestResource)
    end
  end
end