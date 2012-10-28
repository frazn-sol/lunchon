window.Lunchon =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Lunchon.Routers.Deals
    @cart = new Lunchon.Models.Cart
    Backbone.history.start()

$(document).ready ->
  Lunchon.init()
  
