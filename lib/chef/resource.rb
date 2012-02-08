class Chef::Resource
  def self.all
    collection = []

    client.get(resouce_class.name.downcase.pluralize).each do |resouce_name, resouce_url|
      collection << resouce_class.new(resouce_name, resouce_url)
    end

    collection
  end

  def initialize(name, url)
    @name       = name
    @fetch_url  = url
  end

private

  def self.resouce_class
    self
  end

  def self.client
    @@client ||= Chef::Client.new({
      :url =>         Rails.application.config.chef_server_url,
      :client_name => Rails.application.config.client_name,
      :client_key =>  Rails.application.config.client_key
    })
  end
end