class Lunchon.Routers.LunchBags extends Backbone.Router
  routes:
    '': 'show'

  initialize: ->
    @lunch_bag = new Lunchon.Models.LunchBag
    #@lunch_bag.reset($('#container').data 'lunch_bag')

  show: ->
    view = new Lunchon.Views.LunchBag(model: @lunch_bag)
    #$('#container').html(view.render().el)
