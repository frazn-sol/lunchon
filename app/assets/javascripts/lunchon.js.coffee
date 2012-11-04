window.Lunchon =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    @deals = new Lunchon.Routers.Deals
    @lunch_bag = new Lunchon.Models.LunchBag

    Backbone.history.start()

$(document).ready ->
  Lunchon.init()
  
