class Lunchon.Views.CartItemsIndex extends Backbone.View

  model: Lunchon.Models.CartItem
  template: JST['cart_items/index']


  initialize: ->
    @collection.on('add', @appendItem, this)

  appendItem: ->
