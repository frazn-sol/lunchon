class Lunchon.Views.CartItem extends Backbone.View
  template: JST['cart_items/cart_item']

  events:
    'click a.close': 'removeItem'

  removeItem: ->
    Lunchon.cart.removeItem @.model
    $(@el).remove()

  render: ->
    $(@el).html(@template(cart_item: @model))
    this
