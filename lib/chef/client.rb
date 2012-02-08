require 'mixlib/authentication/signedheaderauth'

class Chef::Client
  def initialize(configuration)
    @url         = configuration[:url]
    @client_name = configuration[:client_name]
    @client_key  = configuration[:client_key]
  end

  def get(resource, id = "", params = {})
    request_path = "/#{resource}/#{id}"

    result = RestClient.get "#{@url}#{request_path}", sign_headers(:get, :path => request_path)
    JSON.parse(result)
  end

private

  def sign_headers(http_method, request_params={})
    request_params.reverse_merge! :http_method => http_method, :body => "", :accept => "application/json"
    request_params[:timestamp] = Time.now.utc.iso8601
    request_params[:user_id]   = @client_name

    signer = Mixlib::Authentication::SignedHeaderAuth.signing_object(request_params)
    signer.sign(@client_key).merge(:accept => "application/json")
  end
end
  