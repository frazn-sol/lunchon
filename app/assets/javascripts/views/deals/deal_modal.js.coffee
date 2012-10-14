class Lunchon.Views.DealModal extends Backbone.View
  template: JST['deals/deal_modal']

  events:
    'click button.add_to_cart': 'addToCart'

  addToCart: (event) ->
    console.log('addToCart')
    cart_item = new Lunchon.Models.CartItem deal_id: @model.get('id'), price: @model.get('price'), original_price: @model.get('original_price')
    Lunchon.cart_items.add cart_item
    console.log(Lunchon.cart_items)

  render: ->
    $(@el).html(@template(deal: @model))
    this

