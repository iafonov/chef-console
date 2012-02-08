require 'mixlib/authentication/signedheaderauth'

class Chef::Client
  class ClientError < RuntimeError
  end

  def initialize(configuration)
    @url         = configuration[:url]
    @client_name = configuration[:client_name]
    @client_key  = configuration[:client_key]
  end

  def get(resource, id = "", params = {})
    request_path = "/#{resource}/#{id}"

    begin
      result = RestClient.get "#{@url}#{request_path}", sign_headers(:get, :path => request_path)
    rescue RestClient::Unauthorized => e
      raise ClientError.new("Client runtime error. Something went wrong during authorization")
    rescue RestClient::ResourceNotFound => e
      raise ClientError.new("Client runtime error. Requested URL was not found by Chef server")
    rescue RestClient::InternalServerError => e
      raise ClientError.new("Client runtime error. Chef server error")
    end

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
  