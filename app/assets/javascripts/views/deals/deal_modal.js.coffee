class Lunchon.Views.DealModal extends Backbone.View
  template: JST['deals/deal_modal']

  events:
    'click button.add_to_cart': 'addToCart'

  addToCart: (event) ->
    cart_item = new Lunchon.Models.CartItem deal_id: @model.get('id'), deal_name: @model.get('name'), price: @model.get('price'), original_price: @model.get('original_price')
    cart_item_view = new Lunchon.Views.CartItem(model: cart_item)
    Lunchon.cart_items.add cart_item
    console.log(cart_item_view)
    $('div#cart_items').append(cart_item_view.render().el)
    $('#modal').modal('hide')

  render: ->
    $(@el).html(@template(deal: @model))
    this

