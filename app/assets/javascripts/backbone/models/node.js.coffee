class ChefConsole.Models.Node extends Backbone.Model

class ChefConsole.Collections.NodesCollection extends Backbone.Collection
  model: ChefConsole.Models.Node
  url: '/nodes'
