require 'spec_helper'

describe Chef::Client do
  let(:client) do
    Chef::Client.new({
      :url => "example.com",
      :client_name => "igor",
      :client_key => OpenSSL::PKey::RSA.new(fixture_file("client.pem"))
    })
  end

  context "requesting resource" do
    before do
      stub_request(:get, "http://example.com/nodes/").to_return(:body => fixture_file("nodes.json"))
    end

    let!(:result) { client.get(:nodes) }

    it "constructs valid url for resource" do
      a_request(:get, "http://example.com/nodes/").should have_been_made
    end

    it "sets accept header" do
      a_request(:get, "http://example.com/nodes/").with(:headers => {'Accept' => 'application/json'}).should have_been_made 
    end

    it "sets request with key" do
      a_request(:get, "http://example.com/nodes/").with(:headers => {'X-Ops-Content-Hash' => '2jmj7l5rSw0yVb/vlWAYkK/YBwk='}).should have_been_made 
    end

    it "parses returned json" do
      result.should be_kind_of(Hash)
    end
  end

  context "requesting singular resource and providing id" do
    it "allows fetching resources by their identity" do
      stub_request(:get, "http://example.com/nodes/shard2").to_return(:body => fixture_file("nodes.json"))

      client.get(:nodes, :shard2)

      a_request(:get, "http://example.com/nodes/shard2").should have_been_made
    end
  end
end