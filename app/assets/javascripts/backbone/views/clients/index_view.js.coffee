ChefConsole.Views.Clients ||= {}

class ChefConsole.Views.Clients.IndexView extends Backbone.View
  template: JST["backbone/templates/clients/index"]

  initialize: () ->
    @options.collection.bind('reset', @addAll)

  addAll: () =>
    @options.collection.each(@addOne)

  addOne: (client) =>
    view = new ChefConsole.Views.Clients.ClientView({model : client})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(clients: @options.collection.toJSON() ))
    @addAll()

    return this
