class ClientsController < ApplicationController
  respond_to :json, :html

  def index
    respond_with Client.all
  end
end
