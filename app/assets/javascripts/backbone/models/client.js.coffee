class ChefConsole.Models.Client extends Backbone.Model
  paramRoot: 'client'

  defaults:
    name: null

class ChefConsole.Collections.ClientsCollection extends Backbone.Collection
  model: ChefConsole.Models.Client
  url: '/clients'
