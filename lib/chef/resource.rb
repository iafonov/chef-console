class Chef::Resource
  attr_reader :name

  def self.all
    collection = []

    client.get(resouce_path).each do |resouce_name, resouce_url|
      collection << resouce_class.new(resouce_name, resouce_url)
    end

    collection.sort{ |a, b| a.name <=> b.name }
  end

  def self.fetch(name)
    client.get(resouce_path, name)
  end

  def self.find(resource_id)
    all.select{ |resource| resource.name == resource_id }.first
  end

  def initialize(name, url)
    @name      = name
    @id        = name
    @fetch_url = url
  end

  def fetch
    self.class.fetch(name)
  end

private

  def self.resouce_path
    resouce_class.name.downcase.pluralize
  end

  def self.resouce_class
    self
  end

  def self.client
    @@client ||= Chef::Client.new({
      :url         => Rails.application.config.chef_server_url,
      :client_name => Rails.application.config.client_name,
      :client_key  => Rails.application.config.client_key
    })
  end
end