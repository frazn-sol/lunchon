class Lunchon.Views.CartItemsIndex extends Backbone.View

  model: Lunchon.Models.CartItem
  template: JST['cart_items/index']


  initialize: ->
    console.log('init cart_items')
    @collection.on('add', @appendItem, this)

  appendItem: ->
    console.log(this)
