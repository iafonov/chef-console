class NodesController < ApplicationController
  respond_to :json

  def index
    respond_with(Node.all)
  end
end
