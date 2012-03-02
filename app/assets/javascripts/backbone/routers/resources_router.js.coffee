RESOURCES = ["node", "client"]

class ChefConsole.Routers.ResourcesRouter extends Backbone.Router
  initialize: (options) ->
    @init_collection resource for resource in RESOURCES
    @views = {}

  routes:
    ":resource_plural_name"          : "resourceIndex"
    ":resource_plural_name/new"      : "resourceNew"
    ":resource_plural_name/:id"      : "resourceShow"
    ":resource_plural_name/:id/edit" : "resourceEdit"

  resourceNew: (resource_plural_name) ->
    collection = @[resource_plural_name]

    view = @get_collection_view resource_plural_name, collection, "new"
    $("#active_content").html(view.render().el)


  resourceEdit: (resource_plural_name, id) ->
    resource_name = resource_plural_name.singularize()
    collection = @[resource_plural_name]
    resource = collection.get(id)

    view = @get_resource_view resource_name, resource, "edit"
    $("#active_content").html(view.render().el)
    

  resourceShow: (resource_plural_name, id) ->
    resource_name = resource_plural_name.singularize()
    collection = @[resource_plural_name]
    resource = collection.get(id)

    view = @get_resource_view resource_name, resource, "show"
    $("#active_content").html(view.render().el)

  resourceIndex: (resource_plural_name) ->
    collection = @[resource_plural_name]
    collection.fetch() if collection.isEmpty()

    view = @get_collection_view resource_plural_name, collection, "index"
    $("#active_content").html(view.render().el)

  init_collection: (resource) ->
    collection_name = resource.pluralize()
    collection_class_name = collection_name.capitalize() + "Collection"

    @[collection_name] = new ChefConsole.Collections[collection_class_name]

  get_resource_view: (resource_name, model, action) ->
    views_namespace = resource_name.pluralize().capitalize()
    view_name = action.capitalize() + "View"

    @views[resource_name + "_" + action] ?= 
      new ChefConsole.Views[views_namespace][view_name](model: model)

  get_collection_view: (resource_plural_name, collection, action) ->
    views_namespace = resource_plural_name.capitalize()
    resource_name = resource_plural_name.singularize()

    view_name = action.capitalize() + "View"
    view_params = {}
    view_params["collection"] = collection

    @views[resource_plural_name + "_" + action] ?= 
      new ChefConsole.Views[views_namespace][view_name](view_params)
