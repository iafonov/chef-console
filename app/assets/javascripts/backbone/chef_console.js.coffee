#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.ChefConsole =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: ->
    new ChefConsole.Routers.ResourcesRouter()
    Backbone.history.start()

$(document).ready ->
  ChefConsole.init()