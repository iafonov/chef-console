class Node
  def self.all
    client = Chef::Client.new({
      :url =>         Rails.application.config.chef_server_url,
      :client_name => Rails.application.config.client_name,
      :client_key =>  Rails.application.config.client_key
    })

    client.get(:nodes)
  end
end