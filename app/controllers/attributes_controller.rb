class AttributesController < ApplicationController
  respond_to :json

  def show
    respond_with resource.fetch
  end

private

  def resource
    @resource_cache ||= resource_class.find("shard2")
  end

  def resource_class
    request.path.split("/")[1].singularize.camelize.constantize
  end
end
