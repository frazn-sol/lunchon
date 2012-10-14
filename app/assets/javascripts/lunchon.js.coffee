window.Lunchon =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Lunchon.Routers.Deals
    Backbone.history.start()

$(document).ready ->
  Lunchon.init()
  
