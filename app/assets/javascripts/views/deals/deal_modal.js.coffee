class Lunchon.Views.DealModal extends Backbone.View
  template: JST['deals/deal_modal']

  events:
    'click button.add_to_cart': 'addToCart'

  addToCart: (event) ->
    event.preventDefault()
    Lunchon.cart.addDeal @model
    $('#modal').modal('hide')

  render: ->
    $(@el).html(@template(deal: @model))
    this

