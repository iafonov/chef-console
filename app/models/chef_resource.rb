class ChefResource
  def self.all
    client.get(self.name.pluralize.downcase)
  end

private

  def self.client
    @@client ||= Chef::Client.new({
      :url =>         Rails.application.config.chef_server_url,
      :client_name => Rails.application.config.client_name,
      :client_key =>  Rails.application.config.client_key
    })
  end
end