class Lunchon.Routers.Purchases extends Backbone.Router
  routes:
    'purchases': 'purchases'

  initialize: ->
    @collection = new Lunchon.Collections.Purchases
    this

  removeCart: ->
    $('#cart').remove()

  purchases: ->
    @removeCart()
    @collection.fetch( success: => 
      view = new Lunchon.Views.PurchasesIndex(collection: @collection)
      $('#container').html(view.render().el)
    )
