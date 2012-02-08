class NodesController < ApplicationController
  def index
    render :text => Node.all
  end
end
