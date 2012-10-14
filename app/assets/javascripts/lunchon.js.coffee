window.Lunchon =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Lunchon.Routers.Deals
    @cart = new Lunchon.Models.Cart
    @cart_items = new Lunchon.Collections.CartItems
    Backbone.history.start()

$(document).ready ->
  Lunchon.init()
  
