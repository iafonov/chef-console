class ChefConsole.Routers.NodesRouter extends Backbone.Router
  initialize: (options) ->
    @nodes = new ChefConsole.Collections.NodesCollection()

  routes:
    "node/new"      : "newNode"
    "nodes"         : "index"
    "node/:id/edit" : "edit"
    "node/:id"      : "show"

  newNode: ->
    @view = new ChefConsole.Views.Nodes.NewView(collection: @nodes)
    $("#nodes").html(@view.render().el)

  index: ->
    @nodes.fetch()

    @view = new ChefConsole.Views.Nodes.IndexView(nodes: @nodes)
    $("#nodes").html(@view.render().el)

  show: (id) ->
    node = @nodes.get(id)

    @view = new ChefConsole.Views.Nodes.ShowView(model: node)
    $("#nodes").html(@view.render().el)

  edit: (id) ->
    node = @nodes.get(id)

    @view = new ChefConsole.Views.Nodes.EditView(model: node)
    $("#nodes").html(@view.render().el)
