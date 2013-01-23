class Lunchon.Routers.Support extends Backbone.Router
  routes:
    'support': 'support'

  initialize: ->
    this

  removeCart: ->
    $('#cart').remove()

  support: ->
    @removeCart()
    view = new Lunchon.Views.Support
    $('#container').html(view.render().el)
