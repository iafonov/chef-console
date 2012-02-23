class NodesController < ApplicationController
  respond_to :json, :html

  def index
    respond_with Node.all
  end
end
