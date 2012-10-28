class Lunchon.Views.Cart extends Backbone.View
  template: JST['carts/cart']
  #tagName: 'ul'

  render: ->
    $(@el).html(@template(cart: @cart))
    this
