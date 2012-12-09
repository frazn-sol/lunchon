class Lunchon.Views.PurchaseItem extends Backbone.View
  template: JST['purchase_items/purchase_item']
  tagName: 'li'
  className: 'purchase_item'

  model: Lunchon.Models.PurchaseItem

  events:
    'click button.generate_redemption': 'generateRedemption'

  generateRedemption: (event) ->
    event.preventDefault()
    console.log('generate redemption')

  render: ->
    @$el.html(@template(purchase_item: @model))
    this


