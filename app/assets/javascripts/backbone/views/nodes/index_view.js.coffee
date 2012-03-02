ChefConsole.Views.Nodes ||= {}

class ChefConsole.Views.Nodes.IndexView extends Backbone.View
  template: JST["backbone/templates/nodes/index"]

  initialize: () ->
    @options.collection.bind('reset', @addAll)

  addAll: () =>
    @options.collection.each(@addOne)

  addOne: (node) =>
    view = new ChefConsole.Views.Nodes.NodeView({model : node})
    @$("ul").append(view.render().el)

  render: =>
    $(@el).html(@template(nodes: @options.collection.toJSON() ))
    @addAll()

    return this
