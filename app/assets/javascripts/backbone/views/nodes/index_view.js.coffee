ChefConsole.Views.Nodes ||= {}

class ChefConsole.Views.Nodes.IndexView extends Backbone.View
  template: JST["backbone/templates/nodes/index"]

  initialize: () ->
    @options.nodes.bind('reset', @addAll)

  addAll: () =>
    @options.nodes.each(@addOne)

  addOne: (node) =>
    view = new ChefConsole.Views.Nodes.NodeView({model : node})
    @$("ul").append(view.render().el)

  render: =>
    $(@el).html(@template(nodes: @options.nodes.toJSON() ))
    @addAll()

    return this
