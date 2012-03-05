class ChefConsole.Models.NodeAttributes extends Backbone.Model

class ChefConsole.Models.Node extends Backbone.Model
  resourceAttributes: ->
    attrs = new ChefConsole.Models.NodeAttributes()
    attrs.urlRoot = 'nodes/' + @get("id") + '/attributes'
    attrs.fetch()
    attrs

class ChefConsole.Collections.NodesCollection extends Backbone.Collection
  model: ChefConsole.Models.Node
  url: '/nodes'
